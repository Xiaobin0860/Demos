#ifndef MOF_CCSPRITE_H
#define MOF_CCSPRITE_H

class CCSprite{
public:
	void getTexture(void);
	void draw(void);
	void setDisplayFrameWithAnimationName(char const*,int);
	void setAnchorPoint(cocos2d::CCPoint const&);
	void getColor(void);
	void setBlendFunc(cocos2d::_ccBlendFunc);
	void addChild(cocos2d::CCNode *,int,int);
	void getBatchNode(void);
	void setRotation(float);
	void getBlendFunc(void);
	void setDisplayFrameWithAnimationName(char const*, int);
	void setSkewY(float);
	void updateTransform(void);
	void setOpacity(uchar);
	void setScale(float);
	void setDisplayTextureWithSprite(cocos2d::CCSprite*);
	void setFlipX(bool);
	void reorderChild(cocos2d::CCNode *,int);
	void initWithFile(char const*,cocos2d::CCRect const&);
	void initWithFile(char const*, cocos2d::CCRect const&);
	void setVertexRect(cocos2d::CCRect const&);
	void initWithTexture(cocos2d::CCTexture2D *, cocos2d::CCRect const&, bool);
	void createWithSpriteFrameName(char const*);
	void setScaleY(float);
	void setDirtyRecursively(bool);
	void setBatchNode(cocos2d::CCSpriteBatchNode *);
	void ignoreAnchorPointForPosition(bool);
	void initWithTexture(cocos2d::CCTexture2D *, cocos2d::CCRect const&);
	void setTextureRect(cocos2d::CCRect const&,bool,cocos2d::CCSize	const&);
	void setDirty(bool);
	void addChild(cocos2d::CCNode *,int);
	void setOpacityModifyRGB(bool);
	void setTextureCoords(cocos2d::CCRect);
	void setTextureRect(cocos2d::CCRect const&);
	void setTextureRect(cocos2d::CCRect const&, bool, cocos2d::CCSize const&);
	void reorderChild(cocos2d::CCNode *, int);
	void updateBlendFunc(void);
	void displayFrame(void);
	void removeChild(cocos2d::CCNode *,bool);
	void isDirty(void);
	void setOpacity(unsigned char);
	void addChild(cocos2d::CCNode *);
	void removeChild(cocos2d::CCNode *, bool);
	void initWithFile(char const*);
	void setPosition(cocos2d::CCPoint const&);
	void setVisible(bool);
	void setReorderChildDirtyRecursively(void);
	void initWithTexture(cocos2d::CCTexture2D *,cocos2d::CCRect const&,bool);
	void setColor(cocos2d::_ccColor3B const&);
	void setRotationX(float);
	void createWithSpriteFrame(cocos2d::CCSpriteFrame *);
	void setTexture(cocos2d::CCTexture2D *);
	void initWithTexture(cocos2d::CCTexture2D *);
	void initWithSpriteFrame(cocos2d::CCSpriteFrame	*);
	void CCSprite(void);
	void removeAllChildrenWithCleanup(bool);
	void setSkewX(float);
	void setFlipY(bool);
	void isFrameDisplayed(cocos2d::CCSpriteFrame *);
	void addChild(cocos2d::CCNode *, int);
	void setDisplayFrame(cocos2d::CCSpriteFrame *);
	void createWithTexture(cocos2d::CCTexture2D *);
	void getOpacity(void);
	void initWithSpriteFrameName(char const*);
	void create(char const*);
	void ~CCSprite();
	void setScaleX(float);
	void create(void);
	void sortAllChildren(void);
	void setColor(cocos2d::_ccColor3B	const&);
	void addChild(cocos2d::CCNode *, int, int);
	void setRotationY(float);
	void setVertexZ(float);
	void isFlipY(void);
	void initWithTexture(cocos2d::CCTexture2D *,cocos2d::CCRect const&);
	void init(void);
	void updateColor(void);
	void isOpacityModifyRGB(void);
}
#endif