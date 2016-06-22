comment_view=
{
	name="comment_view",type=0,typeName="View",time=0,x=0,y=0,width=720,height=1280,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="bg",type=1,typeName="Image",time=97124520,x=0,y=0,width=720,height=1280,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,file="common/background/room_bg.png"
	},
	{
		name="title_view",type=0,typeName="View",time=97124595,x=0,y=0,width=720,height=130,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTopLeft,
		{
			name="back_btn",type=2,typeName="Button",time=97124605,x=20,y=20,width=86,height=91,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="common/button/back_btn.png"
		}
	},
	{
		name="comment_view",type=0,typeName="View",time=97124735,x=0,y=120,width=720,height=1040,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTopLeft,
		{
			name="comment_bg",type=1,typeName="Image",time=97125113,x=0,y=0,width=675,height=1040,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="common/background/comment_bg.png",gridLeft=20,gridRight=20,gridTop=20,gridBottom=20
		},
		{
			name="comment",type=0,typeName="View",time=97251397,x=0,y=0,width=720,height=1040,visible=0,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignCenter,
			{
				name="hot_txt",type=4,typeName="Text",time=97126964,x=-240,y=20,width=128,height=33,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,fontSize=32,textAlign=kAlignLeft,colorRed=80,colorGreen=80,colorBlue=80,string=[[热门评论]]
			},
			{
				name="hot_comment_view",type=0,typeName="View",time=97126882,x=0,y=75,width=630,height=466,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,
				{
					name="item",type=0,typeName="View",time=97291184,x=0,y=0,width=630,height=200,visible=0,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTopLeft,
					{
						name="line",type=1,typeName="Image",time=97291221,x=0,y=0,width=630,height=2,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="common/decoration/name_line.png"
					},
					{
						name="title",type=0,typeName="View",time=97291627,x=0,y=0,width=630,height=80,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
						{
							name="icon_frame",type=1,typeName="Image",time=97291523,x=0,y=20,width=51,height=51,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="userinfo/icon_5151_frame.png"
						},
						{
							name="user_name",type=4,typeName="Text",time=97291679,x=69,y=25,width=140,height=28,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fontSize=28,textAlign=kAlignLeft,colorRed=65,colorGreen=120,colorBlue=190,string=[[JustGogogo]]
						},
						{
							name="order",type=4,typeName="Text",time=97291834,x=150,y=0,width=42,height=28,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,fontSize=28,textAlign=kAlignLeft,colorRed=120,colorGreen=120,colorBlue=120,string=[[1楼]]
						},
						{
							name="like_img",type=1,typeName="Image",time=97292032,x=73,y=0,width=30,height=30,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignRight,file="replay/like_normal.png",
							{
								name="like_txt",type=4,typeName="Text",time=97292116,x=40,y=0,width=28,height=28,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=28,textAlign=kAlignLeft,colorRed=120,colorGreen=120,colorBlue=120,string=[[28]]
							}
						}
					},
					{
						name="content_txt",type=5,typeName="TextView",time=97292381,x=60,y=80,width=570,height=196,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fontSize=28,textAlign=kAlignLeft,colorRed=80,colorGreen=80,colorBlue=80,string=[[所有人都在关心你们装的像不像，而我就问你们装得累不累所有人都在关心你们装的像不像，而我就问你们装得累不累所有人都在关心你们装的像不像，而我就问你们装得累不累所有人都在关心你们装的像不像，而我就问你们装得累不累所有人都在关心你们装的像不像，而我就问你们装得累不累]]
					},
					{
						name="time",type=4,typeName="Text",time=97293157,x=60,y=290,width=80,height=20,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fontSize=20,textAlign=kAlignLeft,colorRed=120,colorGreen=120,colorBlue=120,string=[[54分钟前]]
					}
				}
			},
			{
				name="all_txt",type=4,typeName="Text",time=97127164,x=-240,y=55,width=128,height=33,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=32,textAlign=kAlignLeft,colorRed=80,colorGreen=80,colorBlue=80,string=[[全部评论]]
			},
			{
				name="all_comment_view",type=0,typeName="View",time=97126920,x=0,y=10,width=630,height=422,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom
			}
		},
		{
			name="no_comment",type=0,typeName="View",time=97251450,x=0,y=0,width=720,height=1040,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignCenter,
			{
				name="no_comment",type=1,typeName="Image",time=97251494,x=237,y=400,width=60,height=49,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="common/no_comment.png"
			},
			{
				name="no_comment_txt",type=4,typeName="Text",time=97251514,x=53,y=400,width=184,height=46,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,fontSize=46,textAlign=kAlignLeft,colorRed=130,colorGreen=100,colorBlue=95,string=[[暂无评论]]
			},
			{
				name="line",type=1,typeName="Image",time=97251528,x=0,y=-23,width=460,height=2,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="common/decoration/cutline.png"
			},
			{
				name="comment_btn",type=2,typeName="Button",time=97252069,x=0,y=45,width=250,height=66,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="common/button/no_comment_btn_gress.png",gridLeft=20,gridRight=20,gridTop=20,gridBottom=20,
				{
					name="comment_txt",type=4,typeName="Text",time=97251545,x=0,y=0,width=216,height=36,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=36,textAlign=kAlignLeft,colorRed=25,colorGreen=115,colorBlue=40,string=[[立即发表评论]]
				}
			}
		}
	},
	{
		name="bottom_view",type=0,typeName="View",time=97124881,x=0,y=0,width=200,height=110,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignBottom,
		{
			name="bottom_bg",type=1,typeName="Image",time=97125568,x=0,y=0,width=720,height=111,visible=1,fillParentWidth=1,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="online/room/bottom_menu_bg.png"
		},
		{
			name="input_bg",type=1,typeName="Image",time=97125827,x=-70,y=10,width=526,height=62,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="common/background/input_bg_2.png",gridLeft=20,gridRight=20,gridTop=20,gridBottom=20
		},
		{
			name="edit_send",type=7,typeName="EditTextView",time=97315498,x=-73,y=10,width=500,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=32,textAlign=kAlignLeft,colorRed=255,colorGreen=255,colorBlue=255,string=[[]]
		},
		{
			name="send_btn",type=2,typeName="Button",time=97126470,x=270,y=10,width=128,height=58,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,file="common/button/dialog_btn_3_normal.png",file2="common/button/dialog_btn_3_press.png",
			{
				name="send_txt",type=4,typeName="Text",time=97126577,x=0,y=-3,width=64,height=33,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,fontSize=32,textAlign=kAlignLeft,colorRed=240,colorGreen=230,colorBlue=210,string=[[发送]]
			}
		}
	}
}