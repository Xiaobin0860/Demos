endgate_sub_view=
{
	name="endgate_sub_view",type=0,typeName="View",time=0,x=0,y=0,width=480,height=800,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="endgate_sub_view_bg",type=1,typeName="Image",time=4673090,x=0,y=0,width=480,height=800,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,file="drawable/state_texture_bg.png"
	},
	{
		name="endgate_sub_content_view",type=0,typeName="ScrollView",time=4693197,x=0,y=117,width=480,height=560,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop
	},
	{
		name="endgate_sub_title_view",type=0,typeName="View",time=4673398,x=0,y=0,width=480,height=145,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTopLeft,
		{
			name="endgate_sub_title_bg",type=1,typeName="Image",time=4673928,x=0,y=0,width=480,height=95,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="common/activity_center_top_title_bg.png"
		},
		{
			name="endgate_sub_title_texture_bg",type=1,typeName="Image",time=11950262,x=0,y=0,width=372,height=65,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="common/ending_bg.png"
		},
		{
			name="endgate_sub_title_text",type=4,typeName="Text",time=19994033,x=0,y=11,width=300,height=33,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,fontSize=32,textAlign=kAlignCenter,colorRed=254,colorGreen=223,colorBlue=158,string=[[大关卡标题]]
		},
		{
			name="endgate_sub_back_btn",type=2,typeName="Button",time=4676427,x=0,y=2,width=62,height=62,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="common/ending_back.png"
		},
		{
			name="endgate_sub_userinfo",type=1,typeName="Image",time=24657109,x=0,y=69,width=480,height=76,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="common/userinfo_bg.png",
			{
				name="endgate_sub_user_coin_bg",type=1,typeName="Image",time=11953845,x=197,y=2,width=156,height=34,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="common/userinfo_qihun_bg.png",gridLeft=32,gridRight=32,gridTop=16,gridBottom=16,
				{
					name="endgate_sub_user_coin",type=4,typeName="Text",time=11955463,x=35,y=7,width=0,height=0,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fontSize=18,textAlign=kAlignCenter,colorRed=255,colorGreen=220,colorBlue=0,string=[[0]]
				}
			},
			{
				name="endgate_sub_user_money_bg",type=2,typeName="Button",time=76585608,x=22,y=2,width=156,height=34,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="common/userinfo_coin_bg.png",
				{
					name="endgate_sub_user_money",type=4,typeName="Text",time=11954953,x=37,y=7,width=0,height=0,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fontSize=18,textAlign=kAlignCenter,colorRed=255,colorGreen=220,colorBlue=0,string=[[0]]
				},
				{
					name="add",type=1,typeName="Image",time=76585669,x=116,y=3,width=38,height=30,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="common/add.png"
				}
			},
			{
				name="levelBg",type=1,typeName="Image",time=81935692,x=193,y=3,width=156,height=34,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="common/userinfo_level.png",
				{
					name="levelName",type=4,typeName="Text",time=81935711,x=35,y=0,width=0,height=0,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignLeft,fontSize=24,textAlign=kAlignLeft,colorRed=255,colorGreen=250,colorBlue=0,string=[[]]
				}
			}
		}
	},
	{
		name="endgate_new_sub_bottom_view",type=0,typeName="View",time=76583514,x=0,y=0,width=480,height=800,visible=0,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft
	}
}