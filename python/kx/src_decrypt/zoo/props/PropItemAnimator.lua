PropItemAnimator =  class(EventDispatcher)

function PropItemAnimator:ctor(propItem)
	self.propItem = propItem
end

function PropItemAnimator:create(propItem)
	return PropItemAnimator.new(propItem)
end

function PropItemAnimator:explode( animationTime, usedPositionGlobal, finishCallback)
  local item = self.propItem.item
  local bg_normal = item:getChildByName("bg_normal")
  local bg_label = item:getChildByName("bg_label")
  local icon_add = item:getChildByName("icon_add")

  if self.propItem.item_number:isVisible() then self.propItem.item_number:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(0.15), CCFadeOut:create(0.4))) end
  if bg_label:isVisible() then bg_label:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(0.15), CCFadeOut:create(0.4))) end
  if icon_add:isVisible() then icon_add:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(0.15), CCFadeOut:create(0.4))) end
  bg_normal:stopAllActions()
  bg_normal:setScale(1)
  bg_normal:setRotation(0)
  bg_normal:setOpacity(255)

  local background = bg_normal
  local startAngle = (1 + math.random()*2) * self.propItem.direction
  local array = CCArray:create()
  array:addObject(CCSpawn:createWithTwoActions(CCRotateBy:create(animationTime, startAngle), CCScaleTo:create(animationTime, 0.7, 0.85)))
  array:addObject(CCFadeOut:create(0))
  --array:addObject(CCDelayTime:create(0.001))
  --array:addObject(CCCallFunc:create(finishCallback))
  background:setScale(1.2)
  background:runAction(CCSequence:create(array))
  setTimeOut(finishCallback , animationTime+0.3)

  if self.propItem.prop and self.propItem.prop.itemId then
  	local iconAnimation = PropListAnimation:createIcon(self.propItem.prop.itemId)
  	if iconAnimation then
  		
      local winSize = CCDirector:sharedDirector():getVisibleSize()
      local origin = Director:sharedDirector():getVisibleOrigin()
      local useFallingStar = false
      local itemId = self.propItem:getDefaultItemID()
      if itemId == 10004 then
        self.propItem.isExplodeing = true
        usedPositionGlobal = ccp(winSize.width - 100, winSize.height - 100)
        useFallingStar = true
      end

      if usedPositionGlobal then
        local scene = Director:sharedDirector():getRunningScene()
        local container = CocosObject:create()  
        container:setPosition(ccp(origin.x, origin.y))
        if scene then scene:addChild(container) end

        local flyTime = 0.5
        local positionTo = container:convertToNodeSpace(usedPositionGlobal)
        if useFallingStar then flyTime = 0.7 end

        local position = item:convertToWorldSpace(ccp(self.propItem.iconSize.x + self.propItem.iconSize.width/2, self.propItem.iconSize.y - self.propItem.iconSize.height/2))
        position = container:convertToNodeSpace(position)
        local function onIconAnimated() if container then container:removeFromParentAndCleanup(true) end end
        local iconSpawn = CCMoveTo:create(flyTime, positionTo)
        iconAnimation:runAction(CCSequence:createWithTwoActions(iconSpawn, CCCallFunc:create(onIconAnimated)))
        iconAnimation:setPosition(position)
        container:addChild(iconAnimation)

        if useFallingStar then
          local star = FallingStar:create(ccp(position.x, position.y), ccp(usedPositionGlobal.x, usedPositionGlobal.y))
          container:addChild(star)
        end
      else
        local function onIconAnimated() if iconAnimation then iconAnimation:removeFromParentAndCleanup(true) end end
        local iconSpawn = CCSpawn:createWithTwoActions(CCFadeTo:create(0.6, 100), CCEaseBackIn:create(CCMoveBy:create(0.6, ccp(0, 150))))
        iconAnimation:setPosition(ccp(self.propItem.iconSize.x + self.propItem.iconSize.width/2, self.propItem.iconSize.y - self.propItem.iconSize.height/2))
        iconAnimation:runAction(CCSequence:createWithTwoActions(iconSpawn, CCCallFunc:create(onIconAnimated)))
        item:addChildAt(iconAnimation, 4)
      end
  	end
  end

  local icon = self.propItem.icon
  if icon then icon:setVisible(false) end
end

function PropItemAnimator:bubble(delayTime)
	local maxParticles = 30
	local center = self.propItem.center
	self.propItem.batch:removeChildren(true)
	for i = 1, maxParticles do
	    local sprite = nil
	    if math.random() > 0.5 then sprite = Sprite:createWithSpriteFrameName("prop_bubble10000")
	    else sprite = Sprite:createWithSpriteFrameName("prop_bubble20000") end
	    self.propItem.batch:addChild(sprite)
	    local r = 70 + math.random() * 20
	    local angle = math.random() * 360
	    local x = center.x + r * math.cos(angle)
	    local y = center.y + r * math.sin(angle)
	    local animationTime = 0.3 + math.random()*0.25
	    
	    local spawn = CCArray:create()
	    spawn:addObject(CCFadeOut:create(animationTime))
	    spawn:addObject(CCEaseSineOut:create(CCMoveTo:create(animationTime, ccp(x, y))))
	    spawn:addObject(CCScaleTo:create(animationTime, math.random() + 1))
	    
	    local array = CCArray:create()
	    array:addObject(CCDelayTime:create(math.random()*0.1 + delayTime))
	    array:addObject(CCShow:create())
	    array:addObject(CCSpawn:create(spawn))
	    array:addObject(CCHide:create())

	    sprite:setVisible(false)
	    sprite:setScale(0.3)
	    sprite:setPosition(ccp(center.x + (math.random()*10 - 5), center.y + (math.random()*10 - 5)))
	    sprite:runAction(CCSequence:create(array))
	end
end

function PropItemAnimator:playIncreaseAnimation()
  if self.propItem.isPlayShowAnimation then return self.propItem:updateItemNumber() end

  local function onAnimationFinished()
    self.propItem:updateItemNumber()
    self.propItem.isAnimateHint = false
    if self.propItem.isHintMode then self:tmpAnimation(0) end
  end
  local item = self.propItem.item
  local array = CCArray:create()
  -- array:addObject(CCSpawn:createWithTwoActions(CCEaseSineIn:create(CCScaleTo:create(0.15, 0.6, 0.3)), CCMoveTo:create(0.15, ccp(self.beginPosition.x, self.beginPosition.y))))
  -- array:addObject(CCEaseBackOut:create(CCScaleTo:create(0.35, 1)))
  array:addObject(CCScaleTo:create(0.25, 0))
  array:addObject(CCScaleTo:create(0.25, 1))
  array:addObject(CCCallFunc:create(onAnimationFinished))
  item:stopAllActions()
  item:setRotation(self.startAngle)
  item:runAction(CCSequence:create(array))
end

function PropItemAnimator:shake()
  local animationTimeA, animationTimeB = 0.05, 0.02
  local array = CCArray:create()
  array:addObject(CCRotateBy:create(animationTimeA, -4))
  array:addObject(CCRotateBy:create(animationTimeA*2, 8))
  array:addObject(CCRotateBy:create(animationTimeA, -4))
  array:addObject(CCRotateBy:create(animationTimeB, -2))
  array:addObject(CCRotateBy:create(animationTimeB, 2))
  self.propItem.item:setRotation(self.startAngle)
  self.propItem.item:runAction(CCSequence:create(array))
end

function PropItemAnimator:windover(delayTime)
  local item = self.propItem.item
  if not item or item.isDisposed then return end

  delayTime = delayTime or 0
  local animationTimeA, animationTimeB = 0.2, 0.3
  local array = CCArray:create()
  array:addObject(CCDelayTime:create(delayTime))
  array:addObject(CCRotateTo:create(animationTimeA, -3))
  array:addObject(CCRotateTo:create(animationTimeA * 2, 3))
  array:addObject(CCRotateTo:create(animationTimeA * 1.5, -2))
  array:addObject(CCRotateTo:create(animationTimeA, 2))
  array:addObject(CCRotateTo:create(animationTimeB, -1))
  array:addObject(CCRotateTo:create(animationTimeB, 1))
  array:addObject(CCRotateTo:create(animationTimeB, 0))
  
  self.propItem.item:setRotation(self.startAngle)
  self.propItem.item:stopActionByTag(10250)

  local windAction = CCSequence:create(array)
  windAction:setTag(10250)
  self.propItem.item:runAction(windAction)
end

function PropItemAnimator:pushPropAnimation(delayTime)
  local context = self.propItem
  local item = context.item
  if context.isAnimateHint then 
    print("warning: hint animation is already playing.")
    return 
  end
  context.isAnimateHint = true
  context.isHintMode = true

  local function onHintCallback()
    if not PublishActUtil:isGroundPublish() then 
      local item = context.item
      if item and item.refCocosObj then
        local arr = CCArray:create()
        arr:addObject(CCScaleTo:create(0.3, 0.96, 1.1))
        arr:addObject(CCScaleTo:create(0.3, 0.98, 0.85))
        arr:addObject(CCScaleTo:create(0.3, 0.99, 1.1))
        arr:addObject(CCScaleTo:create(0.3, 1, 0.85))
        arr:addObject(CCScaleTo:create(0.3, 0.99, 1.1))
        arr:addObject(CCScaleTo:create(0.3, 0.98, 0.85))
        local action = CCRepeatForever:create(CCSequence:create(arr))
        item:setPosition(ccp(context.beginPosition.x, context.beginPosition.y))
        item:runAction(action)
      end
    end
  end
  self.hint = self.pushPropAnimation
  item:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(delayTime), CCCallFunc:create(onHintCallback)))
end

function PropItemAnimator:hint(delayTime)
  local context = self.propItem
  local item = context.item
  if context.isAnimateHint then 
  	print("warning: hint animation is already playing.")
  	return 
  end
  context.isAnimateHint = true
  context.isHintMode = true

  local function onHintCallback()
    if not PublishActUtil:isGroundPublish() then 
      local item = context.item
      if item and item.refCocosObj then
        local sequence = CCArray:create()
        sequence:addObject(CCScaleTo:create(0.12, 1.05, 0.6))
        sequence:addObject(CCScaleTo:create(0.24, 0.7, 1.05))
        sequence:addObject(CCSpawn:createWithTwoActions(CCScaleTo:create(0.25, 1), CCEaseBackOut:create(CCMoveBy:create(0.25, ccp(0, 10)))))
        sequence:addObject(CCSpawn:createWithTwoActions(CCScaleTo:create(0.25, 1.05, 1), CCMoveBy:create(0.25, ccp(0, -10))))
        sequence:addObject(CCScaleTo:create(0.1, 1.05, 0.7))
        sequence:addObject(CCScaleTo:create(0.1, 1))
        sequence:addObject(CCDelayTime:create(0.5))
        --item:stopAllActions()
        item:setPosition(ccp(context.beginPosition.x, context.beginPosition.y))
        item:runAction(CCRepeatForever:create(CCSequence:create(sequence)))
      end
    end
  end

  item:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(delayTime), CCCallFunc:create(onHintCallback)))
end

function PropItemAnimator:playMaxUsedAnimation(tipDesc)
	  local array = CCArray:create()
	  array:addObject(CCScaleTo:create(0.3, 1.1))
	  array:addObject(CCDelayTime:create(0.2))
	  array:addObject(CCSpawn:createWithTwoActions(CCScaleTo:create(0.5, 1.3), CCFadeOut:create(0.5)))
	  array:addObject(CCHide:create())
	  local prop_disable_icon = self.propItem.item:getChildByName("prop_disable_icon")
	  prop_disable_icon:setCascadeOpacityEnabled(false)
	  self.propItem.item:setChildIndex(prop_disable_icon, self.propItem.item:getNumOfChildren())
	  prop_disable_icon:setScale(1)
	  prop_disable_icon:setVisible(true)
	  prop_disable_icon:setOpacity(255)
	  prop_disable_icon:stopAllActions()
	  prop_disable_icon:runAction(CCSequence:create(array))

	  local position = prop_disable_icon:getPosition()
	  local label = TextField:create(tipDesc, nil, 22)
	  local function onAnimationFinished() label:removeFromParentAndCleanup(true) end
	  local fade = CCArray:create()
	  fade:addObject(CCMoveBy:create(0.3, ccp(0, 20)))
	  fade:addObject(CCDelayTime:create(0.2))
	  fade:addObject(CCSpawn:createWithTwoActions(CCFadeOut:create(0.5), CCMoveBy:create(0.5, ccp(0, 15))))
	  fade:addObject(CCCallFunc:create(onAnimationFinished))
	  
	  label:setPosition(ccp(position.x, 90))
	  label:runAction(CCSequence:create(fade))
	  self.propItem.item:addChild(label)
end

function PropItemAnimator:tmpAnimation(delayTime)
	  local context = self.propItem
	  local item = context.item
	  if context.isAnimateHint then 
	    print("warning: hint animation is already playing.")
	    return 
	  end
	  context.isAnimateHint = true
	  context.isHintMode = true

	  local function onHintCallback()
	    if not PublishActUtil:isGroundPublish() then 
	      local item = context.item
	      if item and item.refCocosObj then
	        local sequence = CCArray:create()
	        local a = {0.5, 0.75}
	        local cycle = math.random(#a)
	        cycle = a[cycle]
	        local b = {2, 4, 6}
	        local swing = math.random(#b)
	        swing = b[swing]
	        local rotation = item:getRotation()
	        sequence:addObject(CCEaseSineOut:create(CCRotateTo:create(cycle, rotation + swing)))
	        local function repeatForever()
	          local cycle = math.random(#a)
	          cycle = a[cycle]
	          local swing = math.random(#b)
	          swing = b[swing]
	          local repeatFoever = CCArray:create()
	          repeatFoever:addObject(CCEaseSineInOut:create(CCRotateTo:create(cycle, rotation - swing)))
	          repeatFoever:addObject(CCEaseSineInOut:create(CCRotateTo:create(cycle, rotation + swing)))
	          if swing == b[1] then repeatFoever:addObject(CCDelayTime:create(1.5)) end
	          repeatFoever:addObject(CCCallFunc:create(repeatForever))
	          local rep = CCSequence:create(repeatFoever)
	          item:runAction(rep)
	        end
	        sequence:addObject(CCCallFunc:create(repeatForever))
	        item:setPosition(ccp(context.beginPosition.x, context.beginPosition.y))
	        item:runAction(CCSequence:create(sequence))
	      end
	    end
	  end
	  self.hint = self.tmpAnimation
	  item:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(delayTime), CCCallFunc:create(onHintCallback)))
end

function PropItemAnimator:dark( enabled )
	self.propItem.darked = enabled
	local item = self.propItem.item
	if enabled then
  		local darkAnimationTime = 0.5
  		
  		self.propItem.isAnimateHint = false
  		local array = CCArray:create()
  		array:addObject(CCFadeTo:create(darkAnimationTime, 150))
  		array:addObject(CCEaseElasticOut:create(CCScaleTo:create(darkAnimationTime, 0.85)))
  		item:stopAllActions()
  		item:setScale(1)
      	item:setRotation(self.propItem.startAngle)
  		item:setPosition(ccp(self.propItem.beginPosition.x, self.propItem.beginPosition.y))
  		item:runAction(CCSpawn:create(array))
	else
  		local darkAnimationTime = 0.25
		  local array = CCArray:create()
  		array:addObject(CCFadeTo:create(darkAnimationTime, 255))
  		array:addObject(CCEaseElasticOut:create(CCScaleTo:create(darkAnimationTime, 1)))

  		item:setScale(1)
      	item:setRotation(self.startAngle)
		  --item:setOpacity(255)
  		--item:setColor(ccc3(255,255,255))
  		item:stopAllActions()
  		item:runAction(CCSpawn:create(array))

  		self.propItem.isAnimateHint = false
  		if self.propItem.isHintMode then self:hint(0) end
	end
end

function PropItemAnimator:focus( enabled, confirm )
	self.propItem.focused = enabled
	local item = self.propItem.item
	local bg_selected = item:getChildByName("bg_selected")
  	local nameLabel = item:getChildByName("name_label")
 	nameLabel:setOpacity(255)

	if enabled then
		bg_selected:setVisible(true)
		bg_selected:setOpacity(0)
		bg_selected:runAction(CCFadeIn:create(0.2))

		self.isAnimateHint = false

		local animationTime = 1.2
		local sequence = CCSequence:createWithTwoActions(CCScaleTo:create(animationTime, 1.065, 0.95),CCScaleTo:create(animationTime, 0.96, 1))
		item:stopAllActions()
		item:setScale(1)
	    item:setRotation(self.startAngle)
	  	item:setPosition(ccp(self.propItem.beginPosition.x, self.propItem.beginPosition.y))
		item:runAction(CCRepeatForever:create(sequence))

	    nameLabel:setString(self.propItem.itemName or "")
	    nameLabel:setVisible(true)
	else
		item:setScale(1)
    	item:setRotation(self.propItem.startAngle)
		item:setOpacity(255)
		item:setColor(ccc3(255,255,255))
		item:stopAllActions()
		
		bg_selected:stopAllActions()
		bg_selected:runAction(CCSequence:createWithTwoActions(CCFadeOut:create(0.2), CCHide:create()))

    	if not confirm then
      		local tip = Localization:getInstance():getText("prop.use.cancel.tips")
      		nameLabel:setString(tip)
    	end
    
    	nameLabel:runAction(CCSequence:createWithTwoActions(CCFadeOut:create(0.5), CCHide:create()))

		self.propItem.isAnimateHint = false
	
		if self.propItem.isHintMode then self:hint(0) end
		self.propItem.controller:callCancelPropUseCallback(self.propItem.prop.itemId)
	end
end

function PropItemAnimator:show( newIcon )
	  local item = self.propItem.item
	  local pedicle = self.propItem.pedicle
	  if newIcon then
	    pedicle:stopAllActions()
	  	pedicle:setOpacity(0)
	  	pedicle:setVisible(true)
	  	pedicle:runAction(CCSequence:createWithTwoActions(CCDelayTime:create(delay), CCFadeIn:create(0.1)))
	  end

	  local function onAnimationFinished()
	  	self.propItem.isPlayShowAnimation = false
	    self.propItem:hintTemporaryMode()
	  end
	  local animationTime = 0.15 + math.random()*0.15
	  local startAngle = (30 + math.random()*30) * -self.propItem.direction
	  local scaleTo = CCScaleTo:create(animationTime, 1.1)
	  local rotatTo = CCRotateTo:create(animationTime * 10, self.propItem.beginRotation)
	  local array = CCArray:create()
	  array:addObject(CCDelayTime:create(delay))
	  array:addObject(CCShow:create())
	  array:addObject(CCEaseSineOut:create(scaleTo))
	  array:addObject(CCEaseQuarticBackOut:create(CCScaleTo:create(animationTime, 1), 33, -106, 126, -67, 15))
	  array:addObject(CCCallFunc:create(onAnimationFinished))

	  item:stopAllActions()
	  item:setVisible(false)
	  item:setScale(0)
	  item:setRotation(startAngle)
	  item:setPosition(ccp(self.propItem.beginPosition.x, self.propItem.beginPosition.y))
	  item:runAction(CCSequence:create(array))
	  item:runAction(CCEaseElasticOut:create(rotatTo))
end