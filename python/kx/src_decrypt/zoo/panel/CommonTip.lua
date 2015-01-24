
require "zoo.panel.basePanel.BasePanel"

CommonTip = class(BasePanel)

local tType = {
	["negative"] = 1,
	["positive"] = 2,
}
local panels = {}
function CommonTip:showTip(text, panType, callback, duration)
	local panel = CommonTip:create(text, tType[panType], callback, duration)
	local scene = Director:sharedDirector():getRunningScene()
	if panel and scene then
		table.insert(panels, panel)
		while #panels > 2 do
			panels[1]:removeSchedule()
			panels[1]:removeFromParentAndCleanup(true)
			table.remove(panels, 1)
		end
		scene:addChild(panel)
	end
end



function CommonTip:loadRequiredResource( panelConfigFile )
	self.panelConfigFile = panelConfigFile
	self.builder = InterfaceBuilder:create(panelConfigFile)
end

function CommonTip:create(text, panType, callback, duration)
	local panel = CommonTip.new()
	panel:loadRequiredResource(PanelConfigFiles.common_ui)
	if panel:init(text, panType, callback, duration) then
		return panel
	else
		panel = nil
		return nil
	end
end

function CommonTip:dispose()
	BaseUI.dispose(self)
end

function CommonTip:init(text, panType, callback, duration)
	text = text or ""
	panType = panType or 1
	self.callback = callback

	self.ui = self.builder:buildGroup("ui_groups/ui_group_tip_a")--ResourceManager:sharedInstance():buildGroup("commontip")
	BasePanel.init(self, self.ui)
	local originSize = self.ui:getGroupBounds().size
	local wSize = Director:sharedDirector():getWinSize()
	local vSize = Director:sharedDirector():getVisibleSize()
	local vOrigin = Director:sharedDirector():getVisibleOrigin()

	self.text = self.ui:getChildByName("text")
	self.anim1 = self.ui:getChildByName("anim1")
	self.anim2 = self.ui:getChildByName("anim2")
	self.background = self.ui:getChildByName("bg")
	self.background2 = self.ui:getChildByName("bg2")
	if not text then return false end
	if panType == 1 then self.anim1 = nil
	elseif panType == 2 then self.anim2 = nil end
	self.ui:getChildByName("anim"..panType):removeFromParentAndCleanup(true)
	local dim = self.text:getDimensions()
	self.text:setDimensions(CCSizeMake(dim.width, 0))
	self.text:setString(text)
	local bgSize = self.background:getGroupBounds().size
	local bgSize2 = self.background2:getGroupBounds().size
	local bgPos = self.background:getPosition()
	local bgPos2 = self.background2:getPosition()
	local txPos = self.text:getPosition()
	local add = self.text:getContentSize().height - dim.height
	self.background:setPreferredSize(CCSizeMake(bgSize.width, bgSize.height + add))
	self.background2:setPreferredSize(CCSizeMake(bgSize2.width, bgSize2.height + add))
	self.text:setPosition(ccp(txPos.x, txPos.y + add))
	self.background:setPosition(ccp(bgPos.x, bgPos.y + add))
	self.background2:setPosition(ccp(bgPos2.x, bgPos2.y + add))
	local size = self.ui:getGroupBounds().size
	self:setPosition(ccp(vSize.width / 2, (vSize.height - size.height) / 2 + vOrigin.y + originSize.height / 3))
	self:setScale(0)

	local function onTimeout() self:fadeOut() end
	duration = duration or 1
	local function onScaled() self.schedule = Director:sharedDirector():getScheduler():scheduleScriptFunc(onTimeout, duration, false) end
	self:runAction(CCSequence:createWithTwoActions(CCEaseBackOut:create(CCScaleTo:create(0.2, 1)), CCCallFunc:create(onScaled)))

	return true
end

function CommonTip:fadeOut()
	if self.schedule and not self.ui.isDisposed then
		Director:sharedDirector():getScheduler():unscheduleScriptEntry(self.schedule)
		self.schedule = nil
		local function doFade()
			if not self.ui.isDisposed then
				self.background:runAction(CCFadeOut:create(0.2))
				self.background2:runAction(CCFadeOut:create(0.2))
				self.text:runAction(CCFadeOut:create(0.2))
				if self.anim1 then self.anim1:runAction(CCFadeOut:create(0.2)) end
				if self.anim2 then self.anim2:runAction(CCFadeOut:create(0.2)) end
			end
		end
		self:stopAllActions()
		local fade = CCSpawn:createWithTwoActions(CCMoveBy:create(0.2, ccp(0, 100)), CCCallFunc:create(doFade))
		local function removeSelf()
			if not self.ui.isDisposed then self:removeSelf() end
		end
		self:runAction(CCSequence:createWithTwoActions(fade, CCCallFunc:create(removeSelf)))
	else return end
end

function CommonTip:removeSchedule()
	if self.schedule then
		Director:sharedDirector():getScheduler():unscheduleScriptEntry(self.schedule)
		self.schedule = nil
	end
end

function CommonTip:removeSelf()
	self:removeFromParentAndCleanup(true)
	if self.callback then
		self.callback()
	end
end

function CommonTip:onEnterHandler(event)
	-- 什么也不做，仅为了覆盖原方法
end