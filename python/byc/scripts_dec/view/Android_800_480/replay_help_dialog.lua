replay_help_dialog=
{
	name="replay_help_dialog",type=0,typeName="View",time=0,x=0,y=0,width=0,height=0,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="bg",type=1,typeName="Image",time=112343364,x=0,y=0,width=720,height=881,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="common/background/dialog_bg_2.png",gridLeft=50,gridRight=50,gridTop=50,gridBottom=50,
		{
			name="frame",type=1,typeName="Image",time=112343653,x=0,y=60,width=610,height=640,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="common/background/line_bg.png",gridLeft=30,gridRight=30,gridTop=30,gridBottom=30,
			{
				name="content",type=0,typeName="ScrollView",time=112344337,x=0,y=0,width=610,height=640,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft
			},
			{
				name="content_test",type=0,typeName="ScrollView",time=112349008,x=0,y=0,width=610,height=640,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
				{
					name="item",type=0,typeName="View",time=112349009,x=0,y=0,width=610,height=150,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTopLeft,
					{
						name="title",type=4,typeName="Text",time=112349010,x=35,y=20,width=180,height=36,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fontSize=36,textAlign=kAlignLeft,colorRed=135,colorGreen=100,colorBlue=95,string=[[最近对局：]]
					},
					{
						name="content",type=5,typeName="TextView",time=112349011,x=35,y=90,width=560,height=85,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fontSize=28,textAlign=kAlignLeft,colorRed=80,colorGreen=80,colorBlue=80,string=[[自动保存所有联网对局、单机对局、残局过关\n\n和观战的棋局，默认棋谱上限为50盘]]
					}
				}
			}
		},
		{
			name="close_btn",type=2,typeName="Button",time=112343889,x=0,y=55,width=571,height=97,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,file="common/button/dialog_btn_2_normal.png",file2="common/button/dialog_btn_2_press.png",
			{
				name="close_txt",type=4,typeName="Text",time=112344038,x=0,y=0,width=0,height=0,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=38,textAlign=kAlignLeft,colorRed=245,colorGreen=230,colorBlue=210,string=[[关闭]]
			}
		}
	}
}