require "zoo.panel.MessageWithRewardsPanel"

SeasonWeeklyMatchHelpLogic = class()

function SeasonWeeklyMatchHelpLogic:startWithConfig(config)
	local function onHelpSuccess(evt)
		local rewards = evt.data.rewards or {}
		if #rewards > 0 then
			local panel = MessageWithRewardsPanel:create(Localization:getInstance():getText("onapp.weeklymatch.help.success.desc"),
				Localization:getInstance():getText("onapp.weeklymatch.help.success.btn"),
				Localization:getInstance():getText("onapp.weeklymatch.help.success.btn.tip"), rewards)
			panel:popout()
		else
			CommonTip:showTip(Localization:getInstance():getText("onapp.weeklymatch.help.success.over"), "negative")
		end
	end
	local function onPresentSuccess(evt)
		local rewards = evt.data.rewards or {}
		local count = 0
		for i,v in ipairs(rewards) do
			if v.itemId == 18 then
				count = count + v.num
			end
		end
		DcUtil:sendWeeklyRaceItemNum(count)
		local panel
		panel = MessageWithRewardsPanel:create(Localization:getInstance():getText("onapp.weeklymatch.present.success.desc", {num = count}),
			Localization:getInstance():getText("onapp.weeklymatch.present.success.btn"), nil, rewards)
		panel:popout()
	end
	local function onFail(evt)
		CommonTip:showTip(Localization:getInstance():getText("error.tip."..tostring(evt.data)), "negative")
	end
	
	if tonumber(config.action) == 0 then
		DcUtil:seasonWeeklyClickLink()
		return
	elseif tonumber(config.action) == 1 then
		DcUtil:enterGameViaWeeklyRaceQrCode()
	else return end

	local user = UserManager:getInstance():getUserRef()
	if tonumber(config.action) == 1 and user:getTopLevelId() < 30 then
		local panel
		panel = MessageWithRewardsPanel:create(Localization:getInstance():getText("onapp.weeklymatch.err.level.desc"),
			Localization:getInstance():getText("onapp.weeklymatch.err.level.btn"), nil, nil, function()
				panel:onCloseBtnTapped()
				HomeScene:sharedInstance().worldScene:moveNodeToCenter(user:getTopLevelId())
			end)
		panel:popout()
		return
	end
	if tonumber(config.action) == 0 and config.invitecode == UserManager:getInstance().inviteCode then
		CommonTip:showTip(Localization:getInstance():getText("onapp.weeklymatch.err.help.self"), "negative")
		return
	end
	if not UserManager:getInstance():isSameInviteCodePlatform(config.invitecode) then
		CommonTip:showTip(Localization:getInstance():getText("onapp.weeklymatch.err.diff.platform"..tostring(config.action)), "negative")
		return
	end

	local timeStamp = tonumber(config.ts)
	if type(timeStamp) == "number" then
		if tonumber(config.action) == 0 then
			local mark = UserManager:getInstance().mark
			local now = Localhost:time()
			local dayTime = 86400000
			local dayStart = math.floor((now - mark.createTime) / dayTime) * dayTime + mark.createTime
			local dayEnd = dayStart + dayTime
			if timeStamp < dayStart or timeStamp > dayEnd then
				CommonTip:showTip(Localization:getInstance():getText("weekly.race.winter.linkerror.time.tip"), "negative")
				return
			end
		end
	else
		CommonTip:showTip(Localization:getInstance():getText("weekly.race.winter.linkerror.tip"), "negative")
		return
	end
	

	if tonumber(config.action) == 0 then -- 帮助他人获得周赛次数
		local http = GetAutumnMatchHelpRewardsHttp.new(true)
		http:addEventListener(Events.kComplete, onHelpSuccess)
		http:addEventListener(Events.kError, onFail)
		http:syncLoad(config.invitecode)
	elseif tonumber(config.action) == 1 then -- 扫二维码获得周赛道具，1.28中让用户升级，二期需求添加功能
		local function onSuccess(evt)
			onPresentSuccess(evt)
		end
		local function onFail(evt)
			CommonTip:showTip(Localization:getInstance():getText("error.tip."..tostring(evt.data)))
		end
		local weeklyType = SeasonWeeklyRaceConfig:getInstance().weeklyRaceType
		local http = GetWeChatQrCodeReward.new(true, weeklyType)
		http:addEventListener(Events.kComplete, onSuccess)
		http:addEventListener(Events.kError, onFail)
		http:syncLoad(string.gsub(tostring(config.qrid), 'X', '_'))
	end
end

function SeasonWeeklyMatchHelpLogic:openUpdatePanel()
	local home = HomeScene:sharedInstance()
	if home.updateVersionButton and not home.updateVersionButton.isDisposed then
		if not home.updateVersionButton.wrapper:isTouchEnabled() then return end
	else return end

	if RequireNetworkAlert:popout() then
		local updateInfo = UserManager.getInstance().updateInfo
		local curTips = updateInfo.tips
		if CCUserDefault:sharedUserDefault():getStringForKey("game.updateInfo.tips") ~= curTips then
			CCUserDefault:sharedUserDefault():setStringForKey("game.updateInfo.tips",curTips)
			NewVersionUtil:cacheUpdateInfo()
			CCUserDefault:sharedUserDefault():flush()
		end

		-- 1：大版本更新
		if NewVersionUtil:hasPackageUpdate() then 
			local vSize = Director:sharedDirector():getVisibleSize()
			local vOrigin = Director:sharedDirector():getVisibleOrigin()
			local position = ccp(vOrigin.x + vSize.width / 2, vOrigin.y + vSize.height / 2)
			local panel = UpdatePageagePanel:create(position)
			if panel then panel:popout() end

		-- 2：动态更新
		elseif NewVersionUtil:hasDynamicUpdate() then
			local home = HomeScene:sharedInstance()
			if home.updateVersionButton and not home.updateVersionButton.isDisposed then
				home.updateVersionButton.wrapper:setTouchEnabled(false)
			end
			local scene = Director:sharedDirector():getRunningScene()
			if scene:is(HomeScene) then
				DynamicUpdatePanel:onCheckDynamicUpdate(false)
			else
				local _HomeScene = HomeScene
				HomeScene = ActivityScene
				DynamicUpdatePanel:onCheckDynamicUpdate(false)
				HomeScene = _HomeScene
			end
		else 
			-- error
		end
	end
end