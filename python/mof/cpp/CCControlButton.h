#ifndef MOF_CCCONTROLBUTTON_H
#define MOF_CCCONTROLBUTTON_H

class CCControlButton{
public:
	void setTitleColorForState(cocos2d::_ccColor3B, unsigned int);
	void setEnabled(bool);
	void setTitleColorDispatchTable(cocos2d::CCDictionary	*);
	void setSelected(bool);
	void create(std::string, char	const*,	float);
	void ~CCControlButton();
	void getTitleBMFontForState(unsigned int);
	void getVerticalMargin(void);
	void getCurrentTitleColor(void)const;
	void getTitleColorDispatchTable(void)const;
	void ccTouchMoved(cocos2d::CCTouch *, cocos2d::CCEvent *);
	void getTitleLabelForState(uint);
	void getBackgroundSprite(void);
	void getTitleColorForState(uint);
	void getOpacity(void);
	void getCurrentTitleColor(void);
	void setTitleTTFSizeForState(float,uint);
	void getTitleTTFSizeForState(unsigned	int);
	void getVerticalMargin(void)const;
	void init(void);
	void getTitleDispatchTable(void)const;
	void getTitleTTFForState(uint);
	void setTitleForState(cocos2d::CCString *,uint);
	void ccTouchCancelled(cocos2d::CCTouch *, cocos2d::CCEvent *);
	void initWithTitleAndFontNameAndFontSize(std::string,	char const*, float);
	void setBackgroundSpriteFrameForState(cocos2d::CCSpriteFrame *, unsigned int);
	void setTitleLabelDispatchTable(cocos2d::CCDictionary	*);
	void needsLayout(void);
	void getTitleLabel(void)const;
	void getTitleForState(unsigned int);
	void create(cocos2d::CCNode *,cocos2d::extension::CCScale9Sprite *);
	void setTitleLabelForState(cocos2d::CCNode *,	unsigned int);
	void setPreferredSize(cocos2d::CCSize);
	void initWithBackgroundSprite(cocos2d::extension::CCScale9Sprite *);
	void setTitleTTFForState(char	const*,uint);
	void CCControlButton(void);
	void getTitleBMFontForState(uint);
	void getTitleTTFForState(unsigned int);
	void getBackgroundSpriteDispatchTable(void)const;
	void setTitleDispatchTable(cocos2d::CCDictionary *);
	void getCurrentTitle(void);
	void create(cocos2d::CCNode *, cocos2d::extension::CCScale9Sprite *);
	void getTitleColorDispatchTable(void);
	void ccTouchMoved(cocos2d::CCTouch *,cocos2d::CCEvent	*);
	void initWithLabelAndBackgroundSprite(cocos2d::CCNode	*,cocos2d::extension::CCScale9Sprite *);
	void ccTouchEnded(cocos2d::CCTouch *, cocos2d::CCEvent *);
	void setTitleLabelForState(cocos2d::CCNode *,uint);
	void getTitleLabelDispatchTable(void);
	void getHorizontalOrigin(void)const;
	void getBackgroundSpriteForState(unsigned int);
	void ccTouchBegan(cocos2d::CCTouch *, cocos2d::CCEvent *);
	void getLabelAnchorPoint(void);
	void create(cocos2d::extension::CCScale9Sprite *);
	void getTitleLabelDispatchTable(void)const;
	void getHorizontalOrigin(void);
	void getTitleDispatchTable(void);
	void ccTouchMoved(cocos2d::CCTouch *,	cocos2d::CCEvent *);
	void ccTouchCancelled(cocos2d::CCTouch *,cocos2d::CCEvent *);
	void setOpacity(uchar);
	void getBackgroundSpriteDispatchTable(void);
	void setBackgroundSpriteDispatchTable(cocos2d::CCDictionary *);
	void getTitleColorForState(unsigned int);
	void setBackgroundSpriteForState(cocos2d::extension::CCScale9Sprite *,uint);
	void initWithTitleAndFontNameAndFontSize(std::string,char const*,float);
	void setMargins(int,int);
	void getPreferredSize(void);
	void ccTouchEnded(cocos2d::CCTouch *,cocos2d::CCEvent *);
	void getTitleForState(uint);
	void initWithLabelAndBackgroundSprite(cocos2d::CCNode	*, cocos2d::extension::CCScale9Sprite *);
	void getTitleLabelForState(unsigned int);
	void setTitleColorForState(cocos2d::_ccColor3B,uint);
	void getBackgroundSprite(void)const;
	void setTitleLabel(cocos2d::CCNode *);
	void setBackgroundSpriteFrameForState(cocos2d::CCSpriteFrame *,uint);
	void ccTouchEnded(cocos2d::CCTouch *,	cocos2d::CCEvent *);
	void create(std::string,char const*,float);
	void getZoomOnTouchDown(void);
	void setBackgroundSpriteForState(cocos2d::extension::CCScale9Sprite *, unsigned int);
	void setLabelAnchorPoint(cocos2d::CCPoint);
	void getCurrentTitle(void)const;
	void getBackgroundSpriteForState(uint);
	void setTitleBMFontForState(char const*, unsigned int);
	void ccTouchBegan(cocos2d::CCTouch *,cocos2d::CCEvent	*);
	void setOpacity(unsigned char);
	void setTitleBMFontForState(char const*,uint);
	void ccTouchMoved(cocos2d::CCTouch *,cocos2d::CCEvent *);
	void ccTouchBegan(cocos2d::CCTouch *,cocos2d::CCEvent *);
	void setMargins(int, int);
	void setTitleTTFSizeForState(float, unsigned int);
	void setHighlighted(bool);
	void setTitleTTFForState(char	const*,	unsigned int);
	void create(void);
	void getTitleTTFSizeForState(uint);
	void ccTouchBegan(cocos2d::CCTouch *,	cocos2d::CCEvent *);
	void ccTouchEnded(cocos2d::CCTouch *,cocos2d::CCEvent	*);
	void setTitleForState(cocos2d::CCString *, unsigned int);
	void getTitleLabel(void);
	void setBackgroundSprite(cocos2d::extension::CCScale9Sprite *);
	void setZoomOnTouchDown(bool);
}
#endif