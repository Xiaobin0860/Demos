#ifndef MOF_FIGHTINGUI_H
#define MOF_FIGHTINGUI_H

class FightingUI{
public:
	void createStartLimitActivity(void);
	void setAllTime(int);
	void createPetProgress(void);
	void createAngerFuntion(void);
	void showDeadCountAndIntegral(int, int);
	void closeShowLimitTimer(void);
	void startLimitTimeEffect(cocos2d::CCPoint, float);
	void setPetHP(int,int);
	void LimitKillImageIsShow(bool);
	void create(void);
	void showSynPvpTimer(void);
	void onMenuItemShowLitmitKillNodeClicked(cocos2d::CCObject *);
	void setBlameHP(int,int,bool);
	void onMenuIteMoutboarmotorClicked(cocos2d::CCObject *);
	void showDeadDetail(void);
	void worldBossSortShow(bool);
	void limitKillShow(bool);
	void showHandMove(void);
	void closeShowPvpTimer(void);
	void onResolveCCBCCMenuItemSelector(cocos2d::CCObject *,char const*);
	void refreshData(float);
	void setBlameHP(int, int, bool);
	void setAutobattleLabelStata(bool);
	void onMenuItemGotoCityClicked(cocos2d::CCObject *);
	void setAllMyPetsHP(int);
	void onMenuItemTreasureFightRankClicked(cocos2d::CCObject *);
	void scheduleGoBack(float);
	void showTreasureFightRank(void);
	void setRoleInforIsShow(bool);
	void GetJoyStickPointer(void);
	void findCurScoreAward(int);
	void loadEquipSkillsValue(std::vector<RoleEquipSkill, std::allocator<RoleEquipSkill>>);
	void onMenuItemShowRankClicked(cocos2d::CCObject *);
	void spiltAwardStr(std::string);
	void onMenuItemChatClicked(cocos2d::CCObject *);
	void loadEquipSkillsValue(std::vector<RoleEquipSkill,std::allocator<RoleEquipSkill>>);
	void onResolveCCBCCMenuItemSelector(cocos2d::CCObject *,	char const*);
	void readScoreAward(void);
	void createFriendsProgress(void);
	void setSceneName(std::string);
	void onMenuItemOpenAngerClicked(cocos2d::CCObject *);
	void worldBossImageIsShow(bool);
	void onResolveCCBCCMenuItemSelector(cocos2d::CCObject *, char const*);
	void isVipToOutboarmotor(void);
	void showWorldBossSort(std::vector<obj_hurts,std::allocator<obj_hurts>>,int,int);
	void ~FightingUI();
	void showTreasureFightRankBtn(void);
	void getAllTime(void);
	void setFriendHP(int,int);
	void onEnter(void);
	void handIsShow(void);
	void createRemainingTimer(float);
	void setBlameFixedAttribute(LivingObject *);
	void stopHandShow(void);
	void Init(void);
	void createPetEliteSkillMgr(void);
	void effectCallback(cocos2d::CCNode *);
	void showLimitActAward(int);
	void setPlayHP(void);
	void showWorldBossSort(std::vector<obj_hurts, std::allocator<obj_hurts>>, int,	int);
	void setAngerValue(int);
	void setEnemyPetsHP(int);
	void FightingUI(void);
	void refreshRemainingTime(float);
	void InitJoyStick(bool);
	void getAllTime(void)const;
	void getPetEliteSkillMgr(int);
	void showPing(float);
	void changeAngerProgressIcon(float);
	void setPetHP(int, int);
	void showDeadCountAndIntegral(int,int);
	void setBlameFixedAttribute(int,eSceneType);
	void startLimitTimeEffect(cocos2d::CCPoint,float);
	void setFriendHP(int, int);
	void setBlameFixedAttribute(int, eSceneType);
	void refreshPing(float);
	void init(void);
	void onExit(void);
	void showTreasureFightPoint(void);
}
#endif