
BonusLastBombState = class(BaseStableState)

function BonusLastBombState:dispose()
	self.mainLogic = nil
	self.boardView = nil
	self.context = nil
end

function BonusLastBombState:create(context)
	local v = BonusLastBombState.new()
	v.context = context
	v.mainLogic = context.mainLogic
	v.boardView = v.mainLogic.boardView
	return v
end

function BonusLastBombState:onEnter()
	BaseStableState.onEnter(self)

	self.timeCount = 0
	self.nextState = nil
end

function BonusLastBombState:onExit()
	BaseStableState.onExit(self)
	self.timeCount = 0
	self.nextState = nil
end

function BonusLastBombState:update(dt)
	self.timeCount = self.timeCount + 1
	if self.timeCount > GamePlayConfig_BonusTime_ItemBomb_CD then
		self.timeCount = 0
		local bombRet = BombItemLogic:BonusTime_RandomBombOne(self.mainLogic, true)
		if bombRet then
			self.timeCount = GamePlayConfig_BonusTime_ItemBomb_CD
		end
	end
end

function BonusLastBombState:checkTransition()
	local hasItemToHandle = BombItemLogic:BonusTime_RandomBombOne(self.mainLogic, false)
	if not hasItemToHandle then
		self.nextState = self:getNextState()
	end
	return self.nextState
end

function BonusLastBombState:getClassName( ... )
	-- body
	return "BonusLastBombState"
end

function BonusLastBombState:getNextState( ... )
	-- body
	return self.context.roostReplaceStateInBonusSecond
end