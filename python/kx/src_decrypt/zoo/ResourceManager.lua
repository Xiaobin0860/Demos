
-- Copyright C2009-2013 www.happyelements.com, all rights reserved.
-- Create Date:	2013年08月29日 10:27:57
-- Author:	ZhangWan(diff)
-- Email:	wanwan.zhang@happyelements.com

require "hecore.ui.LayoutBuilder"
---------------------------------------------------
-------------- ResourceManager
---------------------------------------------------

assert(not ResourceManager)
ResourceManager = class()

function ResourceManager:init(...)
	assert(#{...} == 0)

	-- --------------------------
	-- ------ Used For Parse Json File
	-- -------------------------

	-- Key : Full File Name
	-- Value: LayoutBuilder
	self.layoutBuilderByFileName	= {}

	-- Key: Group Name
	-- Value: LayoutBuilder
	self.layoutBuilderByGroupName	= {}

	------------------------------------
	---- Set Font
	---------------------------------
	---- Used For Time/Move Counter
	--LayoutBuilder:addGlobalFontFace("Berlin Sans FB Demi", "flash/scenes/gamePlayScene/NormalButton.fnt")
	LayoutBuilder:addGlobalFontFace("Berlin Sans FB Demi", "Helvetica")

	-- Used For Target Progress Counter
	--LayoutBuilder:addGlobalFontFace("微软雅黑", "flash/scenes/gamePlayScene/NormalButton.fnt")

	--------------------------
	-- Used In Panel's Title
	-- -----------------------
	--LayoutBuilder:addGlobalFontFace("WenQuanYiMicroHei", "fnt/titles.fnt")
	local filename = "fnt/titles.fnt"
	if _G.useTraditionalChineseRes then filename = "fnt/zh_tw/titles.fnt" end
	addGlobalDynamicFontMap("WenQuanYiMicroHei", filename)
	addGlobalDynamicFontMap("文泉驿微米黑", filename)

	filename = "fnt/caption.fnt"
	if _G.useTraditionalChineseRes then filename = "fnt/zh_tw/caption.fnt" end
	addGlobalDynamicFontMap("Lucida Bright", filename)
	addGlobalDynamicFontMap("LucidaBright", filename) -- for Flash on OS X

	filename = "fnt/share.fnt"
	--if _G.useTraditionalChineseRes then filename = "fnt/zh_tw/caption.fnt" end
	addGlobalDynamicFontMap("Lucida Fax", filename)
	--------------------------
	-- Used In Panel Button
	-- -----------------------
	--LayoutBuilder:addGlobalFontFace("微软雅黑", "Helvetica")
	filename = "fnt/green_button.fnt"
	if _G.useTraditionalChineseRes then filename = "fnt/zh_tw/green_button.fnt" end
	addGlobalDynamicFontMap("微软雅黑", filename)
	addGlobalDynamicFontMap("Microsoft YaHei Bold", filename)
	addGlobalDynamicFontMap("MicrosoftYaHei", filename)
	addGlobalDynamicFontMap("MicrosoftYaHei-Bold", filename)
	addGlobalDynamicFontMap("Microsoft YaHei", filename)
	
	addGlobalDynamicFontMap("EucrosiaUPC", "fnt/blue_button.fnt")
	addGlobalDynamicFontMap("LetterGothicStd", "fnt/target_amount.fnt")
	addGlobalDynamicFontMap("Letter Gothic Std", "fnt/target_amount.fnt")
	addGlobalDynamicFontMap("LetterGothicStd-Bold", "fnt/target_amount.fnt")
	addGlobalDynamicFontMap("Letter Gothic Std Bold", "fnt/target_amount.fnt")

	filename = "fnt/objectives.fnt"
	if _G.useTraditionalChineseRes then filename = "fnt/zh_tw/objectives.fnt" end
	addGlobalDynamicFontMap("Tahoma", filename)
	addGlobalDynamicFontMap("Prestige Elite Std", "fnt/prop_amount.fnt")
	addGlobalDynamicFontMap("Prestige Elite Std Bold", "fnt/prop_amount.fnt")
	addGlobalDynamicFontMap("PrestigeEliteStd-Bd", "fnt/prop_amount.fnt")
	
	addGlobalDynamicFontMap("SchoolHouse Cursive B", "fnt/score_objectives.fnt")
	addGlobalDynamicFontMap("SchoolHouseCursiveB", "fnt/score_objectives.fnt")
	-- addGlobalDynamicFontMap("Segoe UI", "fnt/score_objectives.fnt")	 
	addGlobalDynamicFontMap("Segoe UI", "fnt/target_amount.fnt")	 
	addGlobalDynamicFontMap("Berlin Sans FB Demi", "fnt/steps_cd.fnt")
	addGlobalDynamicFontMap("Berlin Sans FB Demi Bold", "fnt/steps_cd.fnt")


	-- Used In Level Success Top Panel
	addGlobalDynamicFontMap("Arial", "fnt/target_amount.fnt")
	addGlobalDynamicFontMap("ArialMT", "fnt/target_amount.fnt")
	addGlobalDynamicFontMap("Arial Bold", "fnt/target_amount.fnt")


	-- Add Energy Panel
	addGlobalDynamicFontMap("Algerian", "fnt/5_more_cd.fnt")

	-- Used In HomeScene Energy Button
	filename = "fnt/energy_cd.fnt"
	if _G.useTraditionalChineseRes then filename = "fnt/zh_tw/energy_cd.fnt" end
	addGlobalDynamicFontMap("BrowalliaUPC", filename)
	addGlobalDynamicFontMap("BrowalliaUPC-Bold", filename)
	addGlobalDynamicFontMap("Charcoal CY", filename)
	
	filename = "fnt/hud.fnt"
	if _G.useTraditionalChineseRes then filename = "fnt/zh_tw/hud.fnt" end
	addGlobalDynamicFontMap("Cooper Black", filename)
	-- Used In HomeScene User Picture
	addGlobalDynamicFontMap("David", "fnt/nametag.fnt")
	-- Used In Buy Gold Panel
	addGlobalDynamicFontMap("Vivaldii", "fnt/cashshop.fnt")
	addGlobalDynamicFontMap("Vivaldi", "fnt/cashshop.fnt")

	-- Market Panel
	addGlobalDynamicFontMap("Agency FB", "fnt/store_title.fnt") 
	addGlobalDynamicFontMap("AgencyFB", "fnt/store_title.fnt") 
	addGlobalDynamicFontMap("AgencyFB-Reg", "fnt/store_title.fnt") 
	
	--新手引导用
	filename = "fnt/tutorial.fnt"
	if _G.useTraditionalChineseRes then filename = "fnt/zh_tw/tutorial.fnt" end
	addGlobalDynamicFontMap("Broadway",filename)

	-- fruit tree scene
	filename = "fnt/level_seq_n_energy_cd.fnt"
	addGlobalDynamicFontMap("Georgia", filename)
	addGlobalDynamicFontMap("Georgia Bold", filename)

	-- White item number font
	filename = "fnt/event_default_digits.fnt"
	addGlobalDynamicFontMap("Segoe UI Symbol", filename)
end

function ResourceManager:sharedInstance(...)
	assert(#{...} == 0)

	if not resourceManagerSharedInstance then

		resourceManagerSharedInstance = ResourceManager.new()
		resourceManagerSharedInstance:init()
	end

	return resourceManagerSharedInstance
end

--------------------------------------
----- Parse Json File
----------------------------------------------

function ResourceManager:addJsonFile(jasonFile, ...)
	assert(jasonFile)
	assert(#{...} == 0)

	local fullFilePath	= CCFileUtils:sharedFileUtils():fullPathForFilename(jasonFile)

	-- --------------------
	-- Check If Allready Added
	-- ----------------------
	if self.layoutBuilderByFileName[fullFilePath] then
		return
	end

	-- -----------
	-- Add It
	-- -----------
	he_log_info("ADD Json File : " .. jasonFile)
	local layoutBuilder = LayoutBuilder:createWithContentsOfFile(jasonFile)
	assert(layoutBuilder, "Add Jason File: " .. jasonFile .. " Failed !")

	self.layoutBuilderByFileName[fullFilePath] = layoutBuilder
	
	-- --------------------------------------------------
	-- Add Groups 
	-- Check All Groups Whether Conflict With Previous Added
	-- -------------------------------------------------
	local groups = layoutBuilder:getGroups()
	assert(groups)

	for k,v in pairs(groups) do
		if self.layoutBuilderByGroupName[k] then 

			local assertFalseMsg = "ResourceManager:addJsonFile Duplicated Groups Name (" .. k ..")! \n"
			assertFalseMsg = assertFalseMsg .. "In File " .. layoutBuilder:getJsonFilePath() .. " and " .. self.layoutBuilderByGroupName[k]:getJsonFilePath()

			--assert(false, assertFalseMsg)
		else
			--he_log_info("ADD Groups Name : " .. k)
			self.layoutBuilderByGroupName[k] = layoutBuilder
		end
	end
end

function ResourceManager:buildGroup(groupName, imageSuffix)
	assert(groupName)

	local layoutBuilder = self.layoutBuilderByGroupName[groupName]
	assert(layoutBuilder, "ResourceManager:build Has No Group Name (" .. groupName .. ") !")

	return layoutBuilder:build(groupName, imageSuffix)
end

function ResourceManager:buildGroupWithCustomProperty(groupName, imageSuffix, customPropertyFunc, ...)
	assert(groupName)
	assert(#{...} == 0)

	local layoutBuilder = self.layoutBuilderByGroupName[groupName]
	assert(layoutBuilder, "ResourceManager:buildGroupWithCustomProperty Has No Group Name (" .. groupName .. " ) !")

	return layoutBuilder:buildWithCustomeProperty(groupName, imageSuffix, customPropertyFunc)
end

function ResourceManager:buildBatchGroup(batchMode, groupName, imageSuffix, ...)
	assert(batchMode)
	assert(groupName)
	assert(#{...} == 0)

	local layoutBuilder = self.layoutBuilderByGroupName[groupName]
	assert(layoutBuilder, "ResourceManager:build Has No Group Name (" .. groupName .. ") !")

	return layoutBuilder:buildBatchGroup(batchMode, groupName, imageSuffix)
end

function ResourceManager:getSpriteTexture(groupName, imageSuffix, ...)
	assert(#{...} == 0)

	local sprite = self:buildSprite(groupName, imageSuffix)
	local texture = sprite:getTexture()
	sprite:dispose()

	assert(texture)
	return texture
end

function ResourceManager:buildSprite(groupName, imageSuffix, ...)
	assert(#{...} == 0)

	local group = self:buildGroup(groupName, imageSuffix)

	-- Get The Sprite
	local sprite = group:getChildByName("sprite")
	assert(sprite, "group name \"" .. groupName .. "\" 's sprite layer not found !")

	--he_log_warning("Will Leak Parent !")
	sprite:removeFromParentAndCleanup(false)
	group:dispose()

	return sprite
end

------------------------------------------------------
---- Function About Get The Item Resource
---------------------------------------------------

function ResourceManager:getItemResNameFromType(itemType, ...)
	assert(type(itemType) == "number")
	assert(#{...} == 0)

	if itemType == 2 or itemType == 4 then
		return "itemIcon" .. itemType
	else
		return "Prop_" .. itemType
	end
end

function ResourceManager:buildItemGroup(itemType, ...)
	assert(type(itemType) == "number")
	assert(#{...} == 0)

	local resName = self:getItemResNameFromType(itemType)
	if _isQixiLevel and itemType == ItemType.GEM then -- qixi
		resName = "Prop_10_qixi"
	end
	return self:buildGroup(resName)
end

function ResourceManager:buildItemSprite(itemType, ...)
	assert(type(itemType) == "number")
	assert(#{...} == 0)

	local resName = self:getItemResNameFromType(itemType)

	return self:buildSprite(resName)
end

function ResourceManager:getItemSize(itemType, ...)
	assert(#{...} == 0)

	local resName	= self:getItemResNameFromType(itemType)
	local res	= self:buildItemGroup(resName)
	assert(res)

	local bounds = res:getGroupBounds()
	return bounds.size
end

function ResourceManager:getItemResNameFromGoodsId(goodsId, ...)
	assert(type(goodsId) == "number")
	assert(#{...} == 0)

	return self:buildSprite("Goods_" .. goodsId)
end

---------------------------------------------------------

function ResourceManager:getGroupWidth(groupName, ...)
	assert(groupName)
	assert(#{...} == 0)

	return self:getGroupSize(groupName).width
end

function ResourceManager:getGroupHeight(groupName, ...)
	assert(groupName)
	assert(#{...} == 0)

	return self:getGroupSize(groupName).height
end

function ResourceManager:getGroupSize(groupName, ...)
	assert(groupName)
	assert(#{...} == 0)

	--he_log_warning("Will Leak Memory !")
	local resource	= self:buildGroup(groupName)
	assert(resource)
	local bounds	= resource:getGroupBounds()
	
	resource:dispose()
	return bounds.size
end

-------------------------------------------
------	Parse Plist File
-----------------------------------------------

function ResourceManager:addPlistFile(plistFile, ...)
	assert(plistFile)
	assert(#{...} == 0)
	SpriteUtil:addSpriteFramesWithFile(plistFile, imageFile)
end

function ResourceManager:buildAnimatedSprite(timePerFrame, pattern, begin, length, isReversed)
	return SpriteUtil:buildAnimatedSprite(timePerFrame, pattern, begin, length, isReversed)
end

function ResourceManager:loadNeededJsonFiles(...)
	assert(#{...} == 0)

	for i,v in ipairs(ResourceConfig.json) do
    	self:addJsonFile(v)
    end
end
