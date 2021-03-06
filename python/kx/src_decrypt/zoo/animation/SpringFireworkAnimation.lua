
local function getRealPlistPath(path)
	local plistPath = path
	if __use_small_res then  
		plistPath = table.concat(plistPath:split("."),"@2x.")
	end

	return plistPath
end

--------------------------------------------------------
-------------------SpringFirework-----------------------
--------------------------------------------------------
local FireworkType = table.const{
	kPurple = 1,
	kGreen = 2,
	kYellow = 3,
	kColorful = 4,	
}

SpringFirework = class(Sprite)
function SpringFirework:create(fireworkInfo, endCallback)
	if not fireworkInfo then fireworkInfo = {} end

	local spriteRefName = "firework_tail_big_1_0000"
	if fireworkInfo.fireworkType == FireworkType.kPurple then 
		spriteRefName = "firework_tail_small_1_0000"
	elseif fireworkInfo.fireworkType == FireworkType.kGreen then 
		spriteRefName = "firework_tail_small_2_0000"
	elseif fireworkInfo.fireworkType == FireworkType.kYellow then 
		spriteRefName = "firework_tail_small_3_0000"	
	end

	local s = SpringFirework.new(CCSprite:createWithSpriteFrameName(spriteRefName))
	s:init(fireworkInfo, endCallback)
	return s
end

function SpringFirework:init(fireworkInfo, endCallback)
	local anchorPointX = 0.5
	local anchorPointY = 0.7
	local speed = 1500

	self.fireworkType = fireworkInfo.fireworkType or FireworkType.kColorful
	self.fireworkScale = fireworkInfo.fireworkScale or 1
	self.fromPos = fireworkInfo.fromPos or ccp(0, 0)
	self.endPos = fireworkInfo.endPos or ccp(0, 0)

	local contentSize = self:getContentSize()

	local spriteRefName = "firework_big_1_0000"
	local framName = "firework_big_1_%04d"
	if fireworkInfo.fireworkType == FireworkType.kPurple then 
		spriteRefName = "firework_small_1_0000"
		framName = "firework_small_1_%04d"
	elseif fireworkInfo.fireworkType == FireworkType.kGreen then 
		spriteRefName = "firework_small_2_0000"
		framName = "firework_small_2_%04d"
	elseif fireworkInfo.fireworkType == FireworkType.kYellow then 
		spriteRefName = "firework_small_3_0000"	
		framName = "firework_small_3_%04d"
	end

	self.firework = Sprite:createWithSpriteFrameName(spriteRefName)

	self:addChild(self.firework)
	self.firework:setVisible(false)
	self.firework:setPosition(ccp(contentSize.width*anchorPointX, contentSize.height*anchorPointY))

	-- self:setScale(self.fireworkScale)
	self:setScale(0.4)
	self:setAnchorPoint(ccp(anchorPointX, anchorPointY))

	--转向
	if self.fromPos.x ~= self.endPos.x then
		local rotation = math.atan((self.endPos.x - self.fromPos.x) / math.abs(self.endPos.y - self.fromPos.y)) * 180 / 3.14
		self:setRotation(rotation)
	end

	local flyX = self.endPos.x - self.fromPos.x
	local flyY = self.endPos.y - self.fromPos.y
	local flyDistance = math.sqrt(flyX*flyX + flyY*flyY)
	local flyTime = flyDistance/speed

	local seqArr = CCArray:create()
	local spawnArr = CCArray:create()
	spawnArr:addObject(CCMoveBy:create(flyTime, ccp(flyX, flyY)))
	spawnArr:addObject(CCScaleTo:create(flyTime, self.fireworkScale))
	seqArr:addObject(CCSpawn:create(spawnArr))
	seqArr:addObject(CCFadeTo:create(0.1, 0))
	seqArr:addObject(CCCallFunc:create(function ()
		if self.isDisposed then return end
		local frames = SpriteUtil:buildFrames(framName, 0, 16)
		local animate = SpriteUtil:buildAnimate(frames, kCharacterAnimationTime)
		self.firework:setVisible(true)
		self.firework:play(animate, 0, 1, function ()
			self:removeFromParentAndCleanup(true)
			if endCallback then 
				endCallback()
			end
		end)
	end))
	self:runAction(CCSequence:create(seqArr))
end

--------------------------------------------------------
---------------SpringFireworkAnimation------------------
--------------------------------------------------------
SpringFireworkAnimation = class(CocosObject)
local visibleSize = Director.sharedDirector():getVisibleSize()
local visibleOrigin = Director.sharedDirector():getVisibleOrigin()

function SpringFireworkAnimation:create()
	local s = SpringFireworkAnimation.new(CCNode:create())
	s:init()
	return s
end

function SpringFireworkAnimation:init()
	CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile(getRealPlistPath("flash/scenes/homeScene/home_night/spring_firework_2016.plist"))
	-- self:setPosition(ccp(visibleOrigin.x + visibleSize.width / 2, visibleOrigin.y + visibleSize.height / 2))

	local sp = Sprite:createWithSpriteFrameName("firework_big_1_0000")
	local texture = sp:getTexture()
	self.mainSprite = SpriteBatchNode:createWithTexture(texture)
	self:addChild(self.mainSprite)
end

function SpringFireworkAnimation:playPassLevelFirework(fireworkInfo)
	if self.isDisposed then return end
	
	local child = SpringFirework:create(fireworkInfo)
	self.mainSprite:addChild(child)
	child:setPosition(fireworkInfo.fromPos)
end

function SpringFireworkAnimation:playLongTimeFirework()
	if self.isDisposed then return end

	local function timerFunc()
		if self.isDisposed then return end

		local runningScene = Director:sharedDirector():getRunningScene()
		if runningScene == HomeScene:sharedInstance() then
			local fireworkInfo = {}
			math.randomseed(os.clock())
			fireworkInfo.fireworkType = math.floor(math.random(1, 4))
			fireworkInfo.fireworkScale = math.random(1, 2)
			local randomStartX = math.random(-400, 400)
			if randomStartX < 0 and randomStartX > -100 then 
				randomStartX = randomStartX - 100
			elseif randomStartX >= 0 and randomStartX < 100 then
				randomStartX = randomStartX + 100
			end
			startPosX = 360 + randomStartX
			local endPosX = math.random(startPosX*0.8, startPosX*1.2)
			while(endPosX > 260 and endPosX < 460) do 
				endPosX = math.random(startPosX*0.8, startPosX*1.2)
			end
			fireworkInfo.fromPos = ccp(startPosX, math.random(0, 400))
			fireworkInfo.endPos = ccp(endPosX, math.random(700, 1150))

			local child = SpringFirework:create(fireworkInfo)
			self.mainSprite:addChild(child)
			child:setPosition(fireworkInfo.fromPos)
			--音效
			local fireworkIndex = math.floor(math.random(1, 5))
			GamePlayMusicPlayer:playEffect(GameMusicType["kSpringFirework"..fireworkIndex])
		end
	end

	if not self.schedule then 
		self.schedule = Director:sharedDirector():getScheduler():scheduleScriptFunc(timerFunc, 1, false)
	end
end

function SpringFireworkAnimation:stopLongTimeFirework()
	if self.schedule then 
		Director:sharedDirector():getScheduler():unscheduleScriptEntry(self.schedule)
	end
	self.schedule = nil
end

-- function SpringFireworkAnimation:playClickedFireworkSmall(oriPos)
-- 	if oriPos then 
-- 		local posYMax = visibleOrigin.y + visibleSize.height
-- 		local fireworkInfo = {}
-- 		math.randomseed(os.clock())
-- 		fireworkInfo.fireworkType = math.floor(math.random(1, 4))
-- 		fireworkInfo.fireworkScale = 2
-- 		fireworkInfo.fromPos = ccp(oriPos.x, oriPos.y)
-- 		fireworkInfo.endPos = ccp(oriPos.x, math.random(posYMax - 200, posYMax - 100))

-- 		local child = SpringFirework:create(fireworkInfo)
-- 		self.mainSprite:addChild(child)
-- 		child:setPosition(fireworkInfo.fromPos)

-- 		local fireworkIndex = math.floor(math.random(1, 5))
-- 		GamePlayMusicPlayer:playEffect(GameMusicType["kSpringFirework"..fireworkIndex])
-- 	end
-- end

function SpringFireworkAnimation:playClickedFireworkSmall(oriPos)
	local posYMax = visibleOrigin.y + visibleSize.height

	local function stopTimer()
		if self.clickedSmallSchedule then 
			Director:sharedDirector():getScheduler():unscheduleScriptEntry(self.clickedSmallSchedule)
		end
		self.clickedSmallSchedule = nil
	end

	local fIndex = 1
	local function clickedTimerFunc()
		if self.isDisposed then return end

		local runningScene = Director:sharedDirector():getRunningScene()
		if runningScene == HomeScene:sharedInstance() then
			local fireworkInfo = {}
			math.randomseed(os.clock())
			fireworkInfo.fireworkType = math.floor(math.random(1, 4))
			local endPos = ccp(oriPos.x, posYMax - 150)
			if fIndex == 1 then 
				fireworkInfo.fireworkType = 4
				fireworkInfo.fireworkScale = 2
			elseif fIndex == 2 then 
				fireworkInfo.fireworkScale = 1.5
				endPos = ccp(endPos.x + 120, endPos.y - 75)
			elseif fIndex == 3 then 
				fireworkInfo.fireworkScale = 1.5
				endPos = ccp(endPos.x - 150, endPos.y - 100)
			elseif fIndex == 4 then 
				fireworkInfo.fireworkScale = 1.2
				endPos = ccp(endPos.x + 150, endPos.y - 200)
			end
			fireworkInfo.fromPos = ccp(oriPos.x, oriPos.y)
			fireworkInfo.endPos = ccp(endPos.x, endPos.y)

			local child = SpringFirework:create(fireworkInfo)
			self.mainSprite:addChild(child)
			child:setPosition(fireworkInfo.fromPos)

			local fireworkIndex = math.floor(math.random(1, 5))
			GamePlayMusicPlayer:playEffect(GameMusicType["kSpringFirework"..fireworkIndex])
		else
			stopTimer()
		end

		fIndex = fIndex + 1
		if fIndex > 4 then 
			stopTimer()
		end
	end

	if oriPos and not self.clickedSmallSchedule then 
		self.clickedSmallSchedule = Director:sharedDirector():getScheduler():scheduleScriptFunc(clickedTimerFunc, 0.25, false)
		clickedTimerFunc()
	end
end

function SpringFireworkAnimation:playClickedFireworkBig(oriPos)
	local posYMax = visibleOrigin.y + visibleSize.height

	local function stopTimer()
		if self.clickedBigSchedule then 
			Director:sharedDirector():getScheduler():unscheduleScriptEntry(self.clickedBigSchedule)
		end
		self.clickedBigSchedule = nil
	end

	local fIndex = 1
	local function clickedTimerFunc()
		if self.isDisposed then return end

		local runningScene = Director:sharedDirector():getRunningScene()
		if runningScene == HomeScene:sharedInstance() then
			local fireworkInfo = {}
			math.randomseed(os.clock())
			fireworkInfo.fireworkType = math.floor(math.random(1, 4))
			local endPos = ccp(oriPos.x, posYMax - 200)
			if fIndex == 1 then 
				fireworkInfo.fireworkType = 4
				fireworkInfo.fireworkScale = 2
			elseif fIndex == 2 then 
				fireworkInfo.fireworkScale = 1.3
				endPos = ccp(endPos.x + 150, endPos.y - 50)
			elseif fIndex == 3 then 
				fireworkInfo.fireworkScale = 1.3
				endPos = ccp(endPos.x - 200, endPos.y - 25)
			elseif fIndex == 4 then 
				fireworkInfo.fireworkScale = 1.3
				endPos = ccp(endPos.x - 100, endPos.y + 40)
			elseif fIndex == 5 then 
				fireworkInfo.fireworkScale = 1.3
				endPos = ccp(endPos.x + 50, endPos.y + 10)
			elseif fIndex == 6 then 
				fireworkInfo.fireworkScale = 2
				endPos = ccp(endPos.x - 200, endPos.y - 50)
			elseif fIndex == 7 then 
				fireworkInfo.fireworkScale = 2
				endPos = ccp(endPos.x + 50, endPos.y + 40)
			elseif fIndex == 8 then 
				fireworkInfo.fireworkScale = 1.6
				endPos = ccp(endPos.x + 200, endPos.y - 50)
			end
			fireworkInfo.fromPos = ccp(oriPos.x, oriPos.y)
			fireworkInfo.endPos = ccp(endPos.x, endPos.y)

			local child = SpringFirework:create(fireworkInfo)
			self.mainSprite:addChild(child)
			child:setPosition(fireworkInfo.fromPos)

			local fireworkIndex = math.floor(math.random(1, 5))
			GamePlayMusicPlayer:playEffect(GameMusicType["kSpringFirework"..fireworkIndex])
		else
			stopTimer()
		end

		fIndex = fIndex + 1
		if fIndex > 8 then 
			stopTimer()
		end
	end

	if oriPos and not self.clickedBigSchedule then 
		self.clickedBigSchedule = Director:sharedDirector():getScheduler():scheduleScriptFunc(clickedTimerFunc, 0.25, false)
		clickedTimerFunc()
	end
end

--------------------------------------------------------
---------------ClickedFireworkAnimation------------------
--------------------------------------------------------
ClickedFireworkAnimation = class(CocosObject)

function ClickedFireworkAnimation:create()
	local s = ClickedFireworkAnimation.new(CCNode:create())
	s:init()
	return s
end

function ClickedFireworkAnimation:init()
	local bigFireworkPos = ccp(500, 380)
	local smallFireworkPos = ccp(380, 380)

	CCSpriteFrameCache:sharedSpriteFrameCache():addSpriteFramesWithFile(getRealPlistPath("flash/scenes/homeScene/home_night/clicked_firework.plist"))

	local function onLayerColorTouch(evt)
		local touchLayer = evt.context
		if touchLayer then 
			touchLayer:setTouchEnabled(false)
			if touchLayer.lIndex == 1 then 
				if self.clickedFireworkBig then
					local animate = SpriteUtil:buildAnimate(SpriteUtil:buildFrames('clicked_firework_one_%04d', 16, 17), 1/24)
					self.clickedFireworkBig:stopAllActions()
    				self.clickedFireworkBig:play(animate, 0, 1, function ()
    					if self.clickedFireworkBig then 
    						self.clickedFireworkBig:removeFromParentAndCleanup(true)
    						self.clickedFireworkBig = nil
    					end
    					local scene = HomeScene:sharedInstance()
    					if scene and scene.homeSceneFireworkLayer then 
    						local worldPos = self:convertToWorldSpace(ccp(bigFireworkPos.x, bigFireworkPos.y))
    						scene.homeSceneFireworkLayer:playClickedFireworkBig(worldPos)
    					end
    				end)
				end
			elseif touchLayer.lIndex == 2 then 
				if self.clickedFireworkSmall then 
					local animate = SpriteUtil:buildAnimate(SpriteUtil:buildFrames('clicked_firework_two_%04d', 16, 16), 1/24)
					self.clickedFireworkSmall:stopAllActions()
    				self.clickedFireworkSmall:play(animate, 0, 1, function ()
    					if self.clickedFireworkSmall then 
    						self.clickedFireworkSmall:removeFromParentAndCleanup(true)
    					end
    					local scene = HomeScene:sharedInstance()
    					if scene and scene.homeSceneFireworkLayer then 
    						local worldPos = self:convertToWorldSpace(ccp(smallFireworkPos.x, smallFireworkPos.y))
    						scene.homeSceneFireworkLayer:playClickedFireworkSmall(worldPos)
    					end
    				end)
				end
			end
		end
	end

	if not self.clickedFireworkBig then 
		self.clickedFireworkBig = Sprite:createWithSpriteFrameName('clicked_firework_one_0000')
		self:addChild(self.clickedFireworkBig)
		self.clickedFireworkBig:setPosition(ccp(bigFireworkPos.x, bigFireworkPos.y))

		local animate = SpriteUtil:buildAnimate(SpriteUtil:buildFrames('clicked_firework_one_%04d', 0, 16), 1/24)
    	self.clickedFireworkBig:play(animate)

    	local touchLayer = LayerColor:create()
    	touchLayer.lIndex = 1
	    touchLayer:setAnchorPoint(ccp(0, 0))
	    touchLayer:setColor(ccc3(255,0,0))
	    touchLayer:changeWidthAndHeight(60, 60)
	  	touchLayer:setOpacity(0)
	  	self.clickedFireworkBig:addChild(touchLayer)
	  	touchLayer:setPosition(ccp(12,10))
	  	touchLayer:setTouchEnabled(true, 0, true)
		touchLayer:addEventListener(DisplayEvents.kTouchTap, onLayerColorTouch, touchLayer)
	end

	if not self.clickedFireworkSmall then 
		self.clickedFireworkSmall = Sprite:createWithSpriteFrameName('clicked_firework_two_0000')
		self:addChild(self.clickedFireworkSmall)
		self.clickedFireworkSmall:setPosition(ccp(smallFireworkPos.x, smallFireworkPos.y))

		local animate = SpriteUtil:buildAnimate(SpriteUtil:buildFrames('clicked_firework_two_%04d', 0, 16), 1/24)
    	self.clickedFireworkSmall:play(animate)

    	touchLayer = LayerColor:create()
    	touchLayer.lIndex = 2
	    touchLayer:setAnchorPoint(ccp(0, 0))
	    touchLayer:setColor(ccc3(255,0,0))
	    touchLayer:changeWidthAndHeight(50, 50)
	  	touchLayer:setOpacity(0)
	  	self.clickedFireworkSmall:addChild(touchLayer)
	  	touchLayer:setPosition(ccp(0,0))
	  	touchLayer:setTouchEnabled(true, 0, true)
	  	touchLayer:addEventListener(DisplayEvents.kTouchTap, onLayerColorTouch, touchLayer)
	end
end
