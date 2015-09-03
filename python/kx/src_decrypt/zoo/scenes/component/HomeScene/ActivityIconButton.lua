require "zoo.scenes.component.HomeScene.iconButtons.IconButtonBase"
require "zoo.util.ActivityUtil"

ActivityIconButton = class(IconButtonBase)

function ActivityIconButton:create( source,version )
	local button = ActivityIconButton.new()
	button:init( source,version )
	return button
end

function ActivityIconButton:ctor( ... )
	self.playTipPriority = 0
end
function ActivityIconButton:playHasNotificationAnim(...)
	IconButtonManager:getInstance():addPlayTipIcon(self)
end
function ActivityIconButton:stopHasNotificationAnim(...)
	IconButtonManager:getInstance():removePlayTipIcon(self)
end

function ActivityIconButton:dispose( ... )

	for i,v in ipairs(ActivityUtil.onActivityStatusChangeCallbacks) do
		if v.obj == self and v.func == self.onActivityStatusChange then 
			table.remove(ActivityUtil.onActivityStatusChangeCallbacks,i)
			break
		end
	end

	IconButtonBase.dispose(self)
end

function ActivityIconButton:init( source,version )
	self.id = "ActivityIconButton_" .. source

	self.source = source
	self.version = version

	local config = require("activity/" .. source)

	self.tips = config.tips
	self.clickReplaceScene = config.clickReplaceScene

	self.ui = ResourceManager:sharedInstance():buildGroup("activityImageButtonIcon")
	IconButtonBase.init(self, self.ui)

	self.wrapper:getChildByName("placeholder"):removeFromParentAndCleanup(true)

	self.wrapper:addChildAt(self:buildIcon(),0)

	self.wrapper:setTouchEnabled(false)
	self.wrapper:setTouchEnabled(true,0,false)
	self.wrapper:setButtonMode(true)

	self:setTipPosition(IconButtonBasePos.LEFT)

 	self.wrapper:setPositionX(96/2)
	self.wrapper:setPositionY(-96)

	local manualAdjustX = config.iconManualAdjustX or 0
	local manualAdjustY = config.iconManualAdjustY or 0
	for _,v in pairs({"msgNum","msgBg","rewardIcon"}) do
		local u = self.wrapper:getChildByName(v)
		u:setPositionX(u:getPositionX() - 96/2 + manualAdjustX)
		u:setPositionY(u:getPositionY() + 96 + manualAdjustY)
	end

	if self.tips then 
		self:setTipString(self.tips)
	 	self:playHasNotificationAnim()
	end

	self.wrapper:addEventListener(DisplayEvents.kTouchTap,function( ... )
		if PopoutManager:sharedInstance():haveWindowOnScreen() then 
			return 
		end
		ActivityData.new(self):start(true)
	end)

	table.insert(ActivityUtil.onActivityStatusChangeCallbacks,{
		obj = self,
		func = self.onActivityStatusChange
	})

	self:onActivityStatusChange(self.source)

end

function ActivityIconButton:buildIcon( ... )
	local config = require("activity/" .. self.source)

	local image = Sprite:create("activity/" .. config.icon)
	image:setAnchorPoint(ccp(0.5,0))

	return image
end

function ActivityIconButton:onActivityStatusChange( source )

	if self.source ~= source then 
		return 
	end

	local function setMsgNum( num )
		local msgBg = self.wrapper:getChildByName("msgBg")
		local msgNum = self.wrapper:getChildByName("msgNum")

		self.msgNum = num

		if msgBg and msgNum then 
			msgBg:setVisible(num > 0)
			msgNum:setVisible(num > 0)
			if num > 0 then 
				msgNum:setString(tostring(num))
			end
		end
	end

	local function showRewardIcon( ... )
		local msgBg = self.wrapper:getChildByName("msgBg")
		local msgNum = self.wrapper:getChildByName("msgNum")
		local rewardIcon = self.wrapper:getChildByName("rewardIcon")

		msgBg:setVisible(false)
		msgNum:setVisible(false)

		rewardIcon:setVisible(true)
	end

	local function hideRewardIcon( ... )
		local rewardIcon = self.wrapper:getChildByName("rewardIcon")

		setMsgNum(self.msgNum or 0)
		rewardIcon:setVisible(false)
	end

	setMsgNum(ActivityUtil:getMsgNum( self.source ))
	if ActivityUtil:hasRewardMark( self.source ) then 
		showRewardIcon()
	else
		hideRewardIcon()
	end
end
