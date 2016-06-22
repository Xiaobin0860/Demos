activity_view=
{
	name="activity_view",type=0,typeName="View",time=0,x=0,y=0,width=0,height=0,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="bg",type=1,typeName="Image",time=106294270,x=0,y=0,width=720,height=1280,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTop,file="common/background/model_bg.png"
	},
	{
		name="top_view",type=0,typeName="View",time=106294519,x=0,y=0,width=200,height=206,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTop,
		{
			name="top_board",type=1,typeName="Image",time=106294526,x=0,y=0,width=720,height=106,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTop,file="common/background/title_bg.png"
		},
		{
			name="top_title_bg",type=1,typeName="Image",time=106294527,x=0,y=0,width=484,height=132,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="common/decoration/top_cloth.png",
			{
				name="top_title",type=1,typeName="Image",time=106294528,x=0,y=26,width=216,height=50,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="common/decoration/activity.png"
			},
			{
				name="activity_btn",type=2,typeName="Button",time=111219804,x=46,y=31,width=160,height=40,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="dailytask/activity_btn_choose.png",file2="dailytask/activity_btn_pre.png"
			},
			{
				name="daily_task_btn",type=2,typeName="Button",time=111219857,x=46,y=31,width=160,height=40,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopRight,file="dailytask/daily_task_nor.png",file2="dailytask/daily_task_choose.png"
			},
			{
				name="Image2",type=1,typeName="Image",time=111739157,x=0,y=-11,width=1,height=64,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="common/decoration/line_3.png"
			}
		},
		{
			name="refresh_btn",type=2,typeName="Button",time=111312747,x=37,y=0,width=83,height=125,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopRight,file="common/button/reflash_btn.png",file2="common/button/reflash_btn_press.png"
		}
	},
	{
		name="leaf_left",type=1,typeName="Image",time=106294566,x=0,y=0,width=78,height=163,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="common/decoration/bamboo_left.png"
	},
	{
		name="leaf_right",type=1,typeName="Image",time=106294576,x=0,y=0,width=77,height=137,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopRight,file="common/decoration/bamboo_right.png"
	},
	{
		name="stone_dec",type=1,typeName="Image",time=106294593,x=0,y=229,width=26,height=32,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopRight,file="common/decoration/stone_dec.png"
	},
	{
		name="teapot_dec",type=1,typeName="Image",time=106294605,x=0,y=195,width=85,height=252,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottomLeft,file="common/decoration/teapot_dec.png"
	},
	{
		name="back_btn",type=2,typeName="Button",time=106294507,x=20,y=20,width=86,height=91,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="common/button/back_btn.png",file2="common/button/back_btn_press.png"
	},
	{
		name="activity_handler",type=0,typeName="View",time=106294651,x=0,y=166,width=640,height=1113,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,
		{
			name="no_activity",type=4,typeName="Text",time=106303553,x=0,y=0,width=200,height=150,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=40,textAlign=kAlignCenter,colorRed=80,colorGreen=80,colorBlue=80,string=[[暂无活动]]
		}
	},
	{
		name="daily_task_view",type=0,typeName="View",time=111219940,x=0,y=166,width=640,height=1045,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop
	}
}