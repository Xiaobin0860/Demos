by_phone_retrieve_dialog_view=
{
	name="by_phone_retrieve_dialog_view",type=0,typeName="View",time=0,x=0,y=0,width=480,height=800,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="bg",type=1,typeName="Image",time=91856244,x=0,y=-62,width=618,height=602,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="common/background/dialog_bg_3.png",gridLeft=128,gridRight=128,gridTop=128,gridBottom=128,
		{
			name="back_btn",type=2,typeName="Button",time=91856622,x=-137,y=65,width=244,height=85,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,file="common/button/dialog_btn_8_normal.png",file2="common/button/dialog_btn_8_press.png",
			{
				name="Text2",type=4,typeName="Text",time=91856645,x=0,y=0,width=0,height=0,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=40,textAlign=kAlignLeft,colorRed=240,colorGreen=230,colorBlue=210,string=[[返回]]
			}
		},
		{
			name="edit_1_bg",type=1,typeName="Image",time=91857280,x=53,y=73,width=510,height=62,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="common/background/input_bg_2.png",gridLeft=33,gridRight=33,gridTop=0,gridBottom=0,
			{
				name="phone_num",type=6,typeName="EditText",time=91857429,x=8,y=0,width=502,height=70,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=32,textAlign=kAlignLeft,colorRed=80,colorGreen=80,colorBlue=80,string=[[]]
			}
		},
		{
			name="edit_3_bg",type=1,typeName="Image",time=91873651,x=53,y=163,width=510,height=62,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="common/background/input_bg_2.png",gridLeft=33,gridRight=33,gridTop=0,gridBottom=0,
			{
				name="first_pwd",type=6,typeName="EditText",time=91873652,x=8,y=0,width=502,height=70,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=32,textAlign=kAlignLeft,colorRed=80,colorGreen=80,colorBlue=80,string=[[]]
			}
		},
		{
			name="edit_4_bg",type=1,typeName="Image",time=91873657,x=53,y=254,width=510,height=62,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="common/background/input_bg_2.png",gridLeft=33,gridRight=33,gridTop=0,gridBottom=0,
			{
				name="second_pwd",type=6,typeName="EditText",time=91873658,x=8,y=0,width=502,height=70,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=32,textAlign=kAlignLeft,colorRed=80,colorGreen=80,colorBlue=80,string=[[]]
			}
		},
		{
			name="edit_2_bg",type=1,typeName="Image",time=91857318,x=53,y=342,width=317,height=62,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="common/background/input_bg_2.png",gridLeft=33,gridRight=33,gridTop=0,gridBottom=0,
			{
				name="get_code_btn",type=2,typeName="Button",time=91857378,x=-197,y=0,width=185,height=58,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,file="common/button/dialog_btn_3_normal.png",file2="common/button/gray_btn_1.png",gridLeft=64,gridRight=64,gridTop=0,gridBottom=0,
				{
					name="name",type=4,typeName="Text",time=91857544,x=0,y=0,width=140,height=28,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=28,textAlign=kAlignLeft,colorRed=240,colorGreen=230,colorBlue=210,string=[[获取验证码]]
				},
				{
					name="time",type=4,typeName="Text",time=91857899,x=0,y=0,width=48,height=33,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=32,textAlign=kAlignCenter,colorRed=150,colorGreen=130,colorBlue=120,string=[[60s]]
				}
			},
			{
				name="code_num",type=6,typeName="EditText",time=91857509,x=8,y=0,width=308,height=70,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=32,textAlign=kAlignLeft,colorRed=80,colorGreen=80,colorBlue=80,string=[[]]
			}
		},
		{
			name="confirm_btn",type=2,typeName="Button",time=91857778,x=138,y=64,width=244,height=85,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,file="common/button/dialog_btn_4_normal.png",file2="common/button/dialog_btn_4_press.png",gridLeft=64,gridRight=64,gridTop=0,gridBottom=0,
			{
				name="Text41",type=4,typeName="Text",time=91857812,x=0,y=-2,width=0,height=0,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=40,textAlign=kAlignLeft,colorRed=240,colorGreen=230,colorBlue=210,string=[[确认]]
			}
		}
	}
}