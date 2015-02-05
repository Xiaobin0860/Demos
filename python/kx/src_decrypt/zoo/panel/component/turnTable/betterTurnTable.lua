require "hecore.EventDispatcher"

TurnTable = class(EventDispatcher)

TurnTableEvents = {
	kTouchStart = "TurnTableEvents.kTouchStart",
	kTouchEnd = "TurnTableEvents.kTouchEnd",
	kAnimStart = "TurnTableEvents.kAnimStart",
	kAnimFinish = "TurnTableEvents.kAnimFinish",
	kTouchSlow = "TurnTableEvents.kTouchSlow",
}

function TurnTable:create(ui)
	local ret = TurnTable.new()
	ret:_init(ui)
	return ret
end

function TurnTable:_init(ui)
	self.target = 0
	self.range = 0
	self.ui = ui
	local dispose = self.ui.dispose
	self.ui.dispose = function()
		self.ui:unscheduleUpdate()
		if dispose then dispose(self.ui) end
	end
end

function TurnTable:setTargetAngle(target, range)
	self.target, self.range = -target, range
end

function TurnTable:setEnabled(enabled)
	self.ui:setTouchEnabled(enabled, 0, true)
	if enabled then
		self.ui:addEventListener(DisplayEvents.kTouchBegin, function(evt) self:onTouchBegin(evt) end)
	end
	local scene = Director:sharedDirector():getRunningScene()
	if not scene then return end
	local parent = self.ui:getParent()
	while parent:getParent() do parent = parent:getParent() end
	if parent ~= scene then return end
end

function TurnTable:onTouchBegin(evt)
	self.ui:removeEventListenerByName(DisplayEvents.kTouchBegin)
	local pos = self.ui:getParent():convertToWorldSpace(ccp(self.ui:getPositionX(), self.ui:getPositionY()))
	self.posX, self.posY = pos.x, pos.y
	local angle = math.atan((evt.globalPosition.x - self.posX) / (evt.globalPosition.y - self.posY))
	local distance = ccpDistance(ccp(self.posX, self.posY), evt.globalPosition)
	if ((evt.globalPosition.y - self.posY) / distance) < 0 then angle = angle + math.pi end
	local rotation = self.ui:getRotation()
	while rotation < -90 or rotation > 270 do
		if rotation > 270 then rotation = rotation - 360
		else rotation = rotation + 360 end
	end
	self.startRotation = angle * 180 / math.pi - rotation
	self.rotationRec = {}
	self.lastRotation = rotation
	self.ui:addEventListener(DisplayEvents.kTouchMove, function(evt) self:onTouchMove(evt) end)
	self.ui:addEventListener(DisplayEvents.kTouchEnd, function(evt) self:onTouchEnd(evt) end)
	self:dispatchEvent(Event.new(TurnTableEvents.kTouchStart, {}, self))
end

function TurnTable:onTouchMove(evt)
	local angle = math.atan((evt.globalPosition.x - self.posX) / (evt.globalPosition.y - self.posY))
	local distance = ccpDistance(ccp(self.posX, self.posY), evt.globalPosition)
	if ((evt.globalPosition.y - self.posY) / distance) < 0 then angle = angle + math.pi end
	self.ui:setRotation(angle * 180 / math.pi - self.startRotation)
	if #self.rotationRec >= 10 then table.remove(self.rotationRec, 1) end
	local rotation = self.ui:getRotation()
	while rotation < -90 or rotation > 270 do
		if rotation > 270 then rotation = rotation - 360
		else rotation = rotation + 360 end
	end
	table.insert(self.rotationRec, rotation - self.lastRotation)
	self.lastRotation = rotation
	if self.schedule then Director:sharedDirector():getScheduler():unscheduleScriptEntry(self.schedule) end
	local function onTimeOut() self.rotationRec = {} end
	self.schedule = Director:sharedDirector():getScheduler():scheduleScriptFunc(onTimeOut, 0.1, false)
end

function TurnTable:onTouchEnd(evt)
	self.ui:removeEventListenerByName(DisplayEvents.kTouchMove)
	self.ui:removeEventListenerByName(DisplayEvents.kTouchEnd)
	if self.schedule then Director:sharedDirector():getScheduler():unscheduleScriptEntry(self.schedule) end
	local angle = math.atan((evt.globalPosition.x - self.posX) / (evt.globalPosition.y - self.posY))
	local distance = ccpDistance(ccp(self.posX, self.posY), evt.globalPosition)
	if ((evt.globalPosition.y - self.posY) / distance) < 0 then angle = angle + math.pi end
	self.ui:setRotation(angle * 180 / math.pi - self.startRotation)
	local sum = 0
	for k, v in ipairs(self.rotationRec) do
		local rotation = v
		if rotation > 180 then rotation = rotation - 360
		elseif rotation < -180 then rotation = rotation + 360 end
		sum = sum + rotation
	end
	local rotation = self.ui:getRotation()
	while rotation < -90 or rotation > 270 do
		if rotation > 270 then rotation = rotation - 360
		else rotation = rotation + 360 end
	end
	self.ui:addEventListener(DisplayEvents.kTouchBegin, function(evt) self:onTouchBegin(evt) end)
	sum = sum + rotation - self.lastRotation
	sum = sum / (#self.rotationRec + 1)
	if math.abs(sum) > 7 then
		if sum > 0 then sum = 7
		elseif sum < -7 then sum = -7 end
	end
	if math.abs(sum) > 1.5 then
		self:dispatchEvent(Event.new(TurnTableEvents.kTouchEnd, {speed = sum}, self))
	else
		self:dispatchEvent(Event.new(TurnTableEvents.kTouchSlow, {speed = sum}, self))
	end
end

function TurnTable:stayRotate(sumSpeed)
	local function onUpdate(deltaTime)
		self.ui:setRotation(self.ui:getRotation() + sumSpeed * deltaTime * 60)
	end
	self.ui:unscheduleUpdate()
	self.ui:scheduleUpdateWithPriority(onUpdate, 0)
end

function TurnTable:notCalcStopping(sumSpeed)
	self.ui:runAction(CCEaseSineOut:create(CCRotateBy:create(math.abs(sumSpeed) / 5, sumSpeed * 50)))
end

local function standardAngle(angle)
	if angle < 0 then
		while angle < 0 do angle = angle + 360 end
	end
	if angle > 360 then
		while angle > 360 do angle = angle - 360 end
	end
	return angle
end

function TurnTable:calcStopping(sumSpeed)
	local finalTarget = standardAngle(self.target + math.random() * self.range - self.range / 2)
	local count = math.floor(math.abs(sumSpeed) / 1.5) - 1
	local start = standardAngle(self.ui:getRotation())
	local clockWise = sumSpeed >= 0
	if clockWise and finalTarget - start < 0 then
		count = count + 1
	elseif not clockWise and finalTarget - start > 0 then
		count = count + 1
	end
	local sum = 0
	if not clockWise then
		sum = finalTarget - start - count * 360
	else
		sum = finalTarget - start + count * 360
	end
	local time = sum * 2 / sumSpeed / 60
	local final = self.ui:getRotation() + sum
	local sumTime = 0
	local start = self.ui:getRotation()
	
	local function onUpdate(deltaTime)
		sumTime = sumTime + deltaTime
		local angle = start + sum * math.sin(sumTime / time * math.pi / 2)
		self.ui:setRotation(angle)
		if sumTime >= time then
			self.ui:setRotation(finalTarget)
			self.ui:unscheduleUpdate()
			self:dispatchEvent(Event.new(TurnTableEvents.kAnimFinish, {}, self))
		end
	end
	self.ui:unscheduleUpdate()
	self.ui:scheduleUpdateWithPriority(onUpdate, 0)
	self:dispatchEvent(Event.new(TurnTableEvents.kAnimStart, {speed = sumSpeed}, self))
end