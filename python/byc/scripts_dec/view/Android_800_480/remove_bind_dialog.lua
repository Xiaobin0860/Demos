remove_bind_dialog=
{
	name="remove_bind_dialog",type=0,typeName="View",time=0,x=0,y=0,width=0,height=0,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="blank_bg",type=1,typeName="Image",time=110362473,x=0,y=0,width=0,height=0,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignCenter,file="drawable/transparent_blank.png"
	},
	{
		name="dialog_bg",type=1,typeName="Image",time=110362385,x=0,y=400,width=643,height=374,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="common/background/dialog_bg_2.png",gridLeft=128,gridRight=128,gridTop=128,gridBottom=128,
		{
			name="bind_tips",type=5,typeName="TextView",time=110362751,x=0,y=48,width=437,height=150,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,fontSize=36,textAlign=kAlignCenter,colorRed=80,colorGreen=80,colorBlue=80,string=[[本账号已经成功绑定手机，无需重新绑定]]
		},
		{
			name="Button1",type=2,typeName="Button",time=110362882,x=61,y=242,width=244,height=85,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="common/button/dialog_btn_8_normal.png",
			{
				name="text",type=4,typeName="Text",time=110363099,x=0,y=0,width=200,height=150,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=36,textAlign=kAlignCenter,colorRed=240,colorGreen=230,colorBlue=210,string=[[更换]]
			}
		},
		{
			name="Button2",type=2,typeName="Button",time=110362955,x=342,y=242,width=244,height=85,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="common/button/dialog_btn_4_normal.png",file2="common/button/dialog_btn_4_press.png",
			{
				name="text",type=4,typeName="Text",time=110363133,x=0,y=0,width=200,height=150,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=36,textAlign=kAlignCenter,colorRed=240,colorGreen=230,colorBlue=210,string=[[确定]]
			}
		},
		{
			name="text",type=4,typeName="Text",time=110363180,x=0,y=120,width=200,height=150,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,fontSize=24,textAlign=kAlignCenter,colorRed=80,colorGreen=80,colorBlue=80,string=[[（忘记密码时可直接使用手机登陆）]]
		},
		{
			name="Button3",type=2,typeName="Button",time=110369415,x=0,y=242,width=244,height=85,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="common/button/dialog_btn_4_normal.png",
			{
				name="text",type=4,typeName="Text",time=110369451,x=0,y=0,width=200,height=150,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=36,textAlign=kAlignCenter,colorRed=240,colorGreen=230,colorBlue=210,string=[[确定]]
			}
		}
	}
}