AndroidPayment = class()

local decisionStoragePath = "/smspaydecision.ds"
local defaultSMSPaymentDecision = [[
local androidPlatformName = StartupConfig:getInstance():getPlatformName() 
local province = Cookie.getInstance():read(CookieKey.kLocationProvince)
local numVersion = tonumber(_G.bundleVersion:split(".")[2])

local result = {}
local cmmmBanlist = {"陕西", "山西", "浙江", "江苏", "江西", "宁夏", "新疆", "甘肃", "山东", "辽宁"}
local cmgameBanlist = {"河南", "黑龙江", "广西", "重庆"}
local cmmmOptimalList= {"广东", "河北"}
local cm = table.clone(PlatformConfig.paymentConfig.chinaMobilePayment)
local cu = {Payments.CHINA_UNICOM}
local ct = {Payments.CHINA_TELECOM}
local cuBanList = {"江苏", "广东"}
local ctBanList = {"河北", "广西"} 

if table.includes(cuBanList, province) then
	cu = {}
end

if table.includes(ctBanList, province) then
	ct = {}
end

if numVersion < 23 
	or (numVersion == 23 and (androidPlatformName == "91" 
		or androidPlatformName == "baiduapp" 
		or androidPlatformName == "duoku" 
		or androidPlatformName == "hao123" 
		or androidPlatformName == "tieba"))
	then
	cm = {Payments.CHINA_MOBILE_GAME}
end

if province == "河南" then
	local isRatioOn = false
	local udid = MetaInfo:getInstance():getUdid()
	if udid then
		local subStr = string.sub(udid, -5)
		if subStr then
			local numUid = tonumber(subStr, 16)
			if numUid and numUid % 5 < 3 then
				isRatioOn = true
			end
		end
	end

	local isSupportThirdParty = false	
	local thirdPartyPayment = PlatformConfig.paymentConfig.thirdPartyPayment
	if type(thirdPartyPayment) == "table" then
		if #thirdPartyPayment > 1 then
			isSupportThirdParty = true
		elseif #thirdPartyPayment == 1 then
			if not table.includes(thirdPartyPayment, Payments.UNSUPPORT) then
				isSupportThirdParty = true
			end
		end
	elseif type(thirdPartyPayment) == "string" then
		if thirdPartyPayment ~= Payments.UNSUPPORT then
			isSupportThirdParty = true
		end
	end

	if isRatioOn and isSupportThirdParty then
		table.insert(cmmmBanlist, "河南")
	end
end

local cmmmIndex = table.indexOf(cm, Payments.CHINA_MOBILE)
if cmmmIndex and table.includes(cmmmBanlist, province) then
	table.remove(cm, cmmmIndex)
end

local cmgameIndex = table.indexOf(cm, Payments.CHINA_MOBILE_GAME)
if cmgameIndex and table.includes(cmgameBanlist, province) then
	table.remove(cm, cmgameIndex)
end

if table.indexOf(cm, Payments.CHINA_MOBILE) and table.indexOf(cm, Payments.CHINA_MOBILE_GAME) then
	if table.includes(cmmmOptimalList, province) then
		cm = {Payments.CHINA_MOBILE, Payments.CHINA_MOBILE_GAME}
	else
		cm = {Payments.CHINA_MOBILE_GAME, Payments.CHINA_MOBILE}
	end
end

for _, v in ipairs(cm) do table.insert(result, v) end
for _, v in ipairs(cu) do table.insert(result, v) end
for _, v in ipairs(ct) do table.insert(result, v) end

return result
]]
local instance
function AndroidPayment.getInstance()
	if not instance then
		instance = AndroidPayment.new()
		instance:init()
	end
	return instance
end

function AndroidPayment:init()
	self.thirdPartyPayment = {}
	self.chinaMobilePayment = Payments.UNSUPPORT
	self.chinaUnicomPayment = Payments.UNSUPPORT
	self.chinaTelecomPayment = Payments.UNSUPPORT
end

function AndroidPayment:getAPSMgr()
	return luajava.bindClass("com.happyelements.hellolua.aps.APSManager")
end

-- 当前设备的电信运营商
function AndroidPayment:getOperator() 
	local metaInfo = luajava.bindClass("com.happyelements.android.MetaInfo")
	if metaInfo then
		local optype = metaInfo:getNetOperatorType()
		if optype then 
			return optype:getValue()
		else
			return 0 -- present unknown
		end
	else
		return 0 -- present unknown
	end
end

-- 支付初始化
function AndroidPayment:initPaymentConfig(paymentCfg)
	if not paymentCfg or type(paymentCfg) ~= "table" then 
		return 
	end

	self.thirdPartyPayment = paymentCfg.thirdPartyPayment or {}
	for i,v in ipairs(self.thirdPartyPayment) do
		if v ~= Payments.UNSUPPORT then
			self:registerPayment(v)
		end
	end

	local operator = self:getOperator()
	local extraData = self:getSmsPaymentsExtraData()

	self.chinaMobilePayment = paymentCfg.chinaMobilePayment or Payments.UNSUPPORT
	local v = self:filterCMPayment()
	if v ~= Payments.UNSUPPORT and operator == TelecomOperators.CHINA_MOBILE then
		if v == Payments.CHINA_MOBILE and extraData.mmAppidRule then -- CMMM
			AndroidPayment:setMMAppidRule(extraData.mmAppidRule)
		end
		self:registerPayment(v)
	end

	self.chinaUnicomPayment = paymentCfg.chinaUnicomPayment or Payments.UNSUPPORT
	if self.chinaUnicomPayment ~= Payments.UNSUPPORT and operator == TelecomOperators.CHINA_UNICOM then
		self:registerPayment(self.chinaUnicomPayment)
	end

	self.chinaTelecomPayment = paymentCfg.chinaTelecomPayment or Payments.UNSUPPORT
	if self.chinaTelecomPayment ~= Payments.UNSUPPORT and operator == TelecomOperators.CHINA_TELECOM then
		self:registerPayment(self.chinaTelecomPayment)
	end

end

function AndroidPayment:getNormalThirdPartPayment()
	for i,v in ipairs(self.thirdPartyPayment) do
		if v ~= PlatformPaymentThirdPartyEnum.kWECHAT and v ~= PlatformPaymentThirdPartyEnum.kALIPAY then 
			return v 
		end
	end
	return PlatformPaymentThirdPartyEnum.kUnsupport
end

function AndroidPayment:getThirdPartPayment()
	local currentPayType = PlatformConfig:getCurrentPayType()
	local thirdPartyPayment = PlatformPaymentThirdPartyEnum.kUnsupport
	if currentPayType == PlatformPayType.kNormal then
		for i,v in ipairs(self.thirdPartyPayment) do
			if v ~= PlatformPaymentThirdPartyEnum.kWECHAT and v ~= PlatformPaymentThirdPartyEnum.kALIPAY then 
				thirdPartyPayment = v 
				break
			end 
		end
	elseif currentPayType == PlatformPayType.kWechat then 
		if table.includes(self.thirdPartyPayment, PlatformPaymentThirdPartyEnum.kWECHAT) then
			thirdPartyPayment = PlatformPaymentThirdPartyEnum.kWECHAT
		end
	elseif currentPayType == PlatformPayType.kAlipay then 
		if table.includes(self.thirdPartyPayment, PlatformPaymentThirdPartyEnum.kALIPAY) then
			thirdPartyPayment = PlatformPaymentThirdPartyEnum.kALIPAY
		end
	elseif currentPayType == PlatformPayType.kQihoo then 
		if table.includes(self.thirdPartyPayment, PlatformPaymentThirdPartyEnum.k360) then
			thirdPartyPayment = PlatformPaymentThirdPartyEnum.k360
		end
	elseif currentPayType == PlatformPayType.kWandoujia then 
		if table.includes(self.thirdPartyPayment, PlatformPaymentThirdPartyEnum.kWDJ) then
			thirdPartyPayment = PlatformPaymentThirdPartyEnum.kWDJ
		end
	end
	return thirdPartyPayment
end

function AndroidPayment:getSmsPaymentsExtraData()
	local func = loadstring(self.smsPayDecisionScript)
    local status, _, result = pcall(func)
	print(status)
	print(table.tostring(result))
	if not status or type(result) ~= "table" then
		result = {}
	end
	return result
end

function AndroidPayment:getSmsPayments()
	local func = loadstring(self.smsPayDecisionScript)
    local status, result = pcall(func)
	print(status)
	print(table.tostring(result))
	if not status or not result or type(result) ~= "table" then
		local func = loadstring(defaultSMSPaymentDecision)
	    local status, result = pcall(func)
		if not status or not result or type(result) ~= "table" then
			result = { Payments.CHINA_MOBILE, Payments.CHINA_MOBILE_GAME, Payments.CHINA_UNICOM, Payments.CHINA_TELECOM }
	    end
	end
	-- local function checkArtInUse()
	-- 	return AndroidPayment:getAPSMgr():isArtInUse()
	-- end

	-- local success, ret = pcall(checkArtInUse)
	-- if success and ret then
	-- 	print("isArtInUse")
		-- table.removeValue(result, Payments.CHINA_MOBILE_GAME)
		-- table.removeValue(result, Payments.CHINA_UNICOM)
	-- end
	return result
end

function AndroidPayment:filterCMPayment()
	local cmPayments = self.chinaMobilePayment
    print("filterCMPayment")
	if type(cmPayments) == "table" then
		if PlatformConfig:isCMPaymentSwitchable() then
			if _G.kDefaultCmPayment then
				print("kDefaultCmPayment cmcc")
				return _G.kDefaultCmPayment
			end
		end
		
		print(table.tostring(cmPayments))
		local result = self:getSmsPayments()
		for i, v in ipairs(result) do
			if table.includes(cmPayments, v) then
				print("filter " .. v)
				return v
			end
		end
	    print("default ")
	end
	return PlatformPaymentChinaMobileEnum.kUnsupport
end

function AndroidPayment:filterCUPayment()
	local cuPayment = self.chinaUnicomPayment
	local result = self:getSmsPayments()
	if table.includes(result, cuPayment) then
		return cuPayment
	end
	return PlatformPaymentChinaUnicomEnum.kUnsupport
end

function AndroidPayment:filterCTPayment()
	local ctPayment = self.chinaTelecomPayment
	local result = self:getSmsPayments()
	if table.includes(result, ctPayment) then
		return ctPayment
	end
	return PlatformPaymentChinaTelecomEnum.kUnsupport
end

function AndroidPayment:getDefaultSmsPayment()
	local operator = self:getOperator()
	print("getOperator:", operator)
	if operator == TelecomOperators.CHINA_MOBILE then
		return self:filterCMPayment()
	elseif operator == TelecomOperators.CHINA_UNICOM then
		return self:filterCUPayment()
	elseif operator == TelecomOperators.CHINA_TELECOM then
		return self:filterCTPayment()
	else
		return nil
	end
end

function AndroidPayment:getDefaultPayment(goodsType, price)
	print("AndroidPayment:getDefaultPayment:", goodsType, ",", price)
	if goodsType == 2 and tonumber(price) >= 10 then
		return self:getThirdPartPayment()
	else
		return self:getDefaultSmsPayment()
	end
end

function AndroidPayment:registerPayment(paymentType)
	print("AndroidPayment:registerPayment:", paymentType)
	if not paymentType or type(paymentType) ~= "number" then return end

	if paymentType ~= Payments.UNSUPPORT then
		local success = AndroidPayment:getAPSMgr():getInstance():registerPayment(paymentType)
		if not success then
			he_log_error("registerPayment failed.paymentType="..tostring(paymentType)..",platform="..PlatformConfig.name)
		end
	end
end

function AndroidPayment:getChinaMobileChannelId()
	return AndroidPayment:getAPSMgr():getInstance():getChinaMobileChannelId()
end

function AndroidPayment:getPaymentDelegate(paymentType)
	if not paymentType or type(paymentType) ~= "number" then return nil end
	return AndroidPayment:getAPSMgr():getInstance():getPaymentDelegate(paymentType)
end

function AndroidPayment:isNeedPreOrder(paymentType)
	if not paymentType then return false end
	return table.includes(PaymentsNeedPreOrder, paymentType)
end

function AndroidPayment:isPaymentTypeSupported(paymentType)
	local isCMSupported = false
	if type(self.chinaMobilePayment) == "table" then
		isCMSupported = table.includes(self.chinaMobilePayment, paymentType)
	else
		isCMSupported = self.chinaMobilePayment == paymentType
	end
	local isCUSupported = self.chinaUnicomPayment == paymentType
	local isCTSupported = self.chinaTelecomPayment == paymentType
	local isThirdPartySupported = self:getNormalThirdPartPayment() == paymentType

	return paymentType and (isCMSupported or isCUSupported or isCTSupported or isThirdPartySupported)
end

--已弃用
function AndroidPayment:getPaymentsChoosement()
	local result = {}
	local operator = self:getOperator()
	print("getOperator:", operator)
	if operator == TelecomOperators.CHINA_MOBILE then
		local cmPaymentChoosement = self:filterCMPayment()
		if cmPaymentChoosement and cmPaymentChoosement ~= Payments.UNSUPPORT then result[cmPaymentChoosement] = true end
	elseif operator == TelecomOperators.CHINA_UNICOM then
		local cuPaymentChoosement = self:filterCUPayment()
		if cuPaymentChoosement and cuPaymentChoosement ~= Payments.UNSUPPORT then result[cuPaymentChoosement] = true end
	elseif operator == TelecomOperators.CHINA_TELECOM then
		local ctPaymentChoosement = self:filterCTPayment()
		if ctPaymentChoosement and ctPaymentChoosement ~= Payments.UNSUPPORT then result[ctPaymentChoosement] = true end
	end

	for i, v in ipairs(self.thirdPartyPayment) do
		if v == PlatformPaymentThirdPartyEnum.kWECHAT then 
			if PlatformConfig:isWechatPaySupport() then 
				result[v] = true
			end
		elseif v == PlatformPaymentThirdPartyEnum.kALIPAY then 
			if PlatformConfig:isAliPaySupport() then 
				result[v] = true
			end
		else
			result[v] = true
		end
	end

	return result
end

function AndroidPayment:isSmsPaymentSupported()
	return self:filterCUPayment() ~= Payments.UNSUPPORT
		or self:filterCTPayment() ~= Payments.UNSUPPORT
		or self:filterCMPayment() ~= Payments.UNSUPPORT
end

function AndroidPayment:isThirdPartyPaymentSupported()
	return self:getNormalThirdPartPayment() ~= Payments.UNSUPPORT
end

function AndroidPayment:initCMPaymentDecisionScript()
	local storageSrc = Localhost:readFromStorage(decisionStoragePath)
	print("initCMPaymentDecisionScript")
	if storageSrc then
		print("storageSrc")
		print(storageSrc)
		local func = loadstring(storageSrc)
		local status, result = pcall(func)
		if status then
			print("decode success")
			print(storageSrc)
			self.smsPayDecisionScript = storageSrc
			return
		end
	end

	self.smsPayDecisionScript = defaultSMSPaymentDecision
end

function AndroidPayment:changeSMSPaymentDecisionScript(src)
	if src and src ~= "" and src ~= self.smsPayDecisionScript then
	    local func = loadstring(src)
	    local status, result = pcall(func)
	    print("changeCMPaymentDecisionScript")
	    print(src)
	    if status then
	    	print("change src")
		    local encodeSrc = amf3.encode(src)
	        local path = HeResPathUtils:getUserDataPath() .. decisionStoragePath
	        Localhost:safeWriteStringToFile(encodeSrc, path)
	    end
	end
end

function AndroidPayment:setMMAppidRule(appidRule)
	-- print("AndroidPayment:setMMAppidRule:", table.tostring(appidRule))
	local function setMMAppidRule()
		local rule = {}
		if type(appidRule) == "table" then
			for _,v in ipairs(appidRule) do
				if v.from and v.to then
					rule[tostring(v.from)] = tostring(v.to)
				end
			end
			luajava.bindClass("com.happyelements.android.operatorpayment.iap.IAPPayment"):setAppidReplaceRule(luaJavaConvert.table2Map(rule))
		end
	end
	local success, ret = pcall(setMMAppidRule)
	if not success then
		he_log_error("setMMAppidRule failed. err:"..tostring(ret))
	end
end