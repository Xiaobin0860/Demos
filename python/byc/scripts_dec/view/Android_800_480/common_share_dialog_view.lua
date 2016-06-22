common_share_dialog_view=
{
	name="common_share_dialog_view",type=0,typeName="View",time=0,x=0,y=0,width=0,height=0,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="bg_black",type=1,typeName="Image",time=115371961,x=0,y=0,width=0,height=0,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignCenter,file="drawable/transparent_blank.png"
	},
	{
		name="bg",type=1,typeName="Image",time=115371998,x=0,y=0,width=720,height=620,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,file="common/background/dialog_bg_1.png",gridLeft=128,gridRight=128,gridTop=128,gridBottom=128,
		{
			name="title",type=4,typeName="Text",time=115372083,x=0,y=25,width=200,height=100,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,fontSize=46,textAlign=kAlignCenter,colorRed=80,colorGreen=80,colorBlue=80,string=[[分享棋局]]
		},
		{
			name="Image1",type=1,typeName="Image",time=115372149,x=0,y=118,width=640,height=19,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="common/decoration/line.png"
		},
		{
			name="Image2",type=1,typeName="Image",time=115379867,x=0,y=171,width=643,height=448,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="common/background/line_bg.png",gridLeft=64,gridRight=64,gridTop=64,gridBottom=64
		},
		{
			name="share_view",type=0,typeName="View",time=115372182,x=0,y=210,width=643,height=415,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,
			{
				name="wechat",type=0,typeName="View",time=115372237,x=0,y=0,width=200,height=182,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
				{
					name="btn",type=2,typeName="Button",time=115372255,x=0,y=0,width=130,height=130,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="common/icon/wechat.png"
				},
				{
					name="text",type=4,typeName="Text",time=115372311,x=0,y=0,width=200,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=32,textAlign=kAlignCenter,colorRed=80,colorGreen=80,colorBlue=80,string=[[微信]]
				}
			},
			{
				name="pyq",type=0,typeName="View",time=115372346,x=0,y=0,width=200,height=182,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,
				{
					name="btn",type=2,typeName="Button",time=115372347,x=0,y=0,width=130,height=130,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="common/icon/pyq.png"
				},
				{
					name="text",type=4,typeName="Text",time=115372348,x=0,y=0,width=200,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=32,textAlign=kAlignCenter,colorRed=80,colorGreen=80,colorBlue=80,string=[[朋友圈]]
				}
			},
			{
				name="qq",type=0,typeName="View",time=115372349,x=0,y=0,width=200,height=182,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopRight,
				{
					name="btn",type=2,typeName="Button",time=115372350,x=0,y=0,width=130,height=130,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="common/icon/qq_icon.png"
				},
				{
					name="text",type=4,typeName="Text",time=115372351,x=0,y=0,width=200,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=32,textAlign=kAlignCenter,colorRed=80,colorGreen=80,colorBlue=80,string=[[QQ]]
				}
			},
			{
				name="other",type=0,typeName="View",time=115372350,x=0,y=212,width=200,height=182,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
				{
					name="btn",type=2,typeName="Button",time=115372351,x=0,y=0,width=130,height=130,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="common/icon/share_othe.png"
				},
				{
					name="text",type=4,typeName="Text",time=115372352,x=0,y=0,width=200,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=32,textAlign=kAlignCenter,colorRed=80,colorGreen=80,colorBlue=80,string=[[其他]]
				}
			},
			{
				name="weibo",type=0,typeName="View",time=115372351,x=0,y=212,width=200,height=182,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
				{
					name="btn",type=2,typeName="Button",time=115372352,x=0,y=0,width=130,height=130,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="common/icon/weibo.png"
				},
				{
					name="text",type=4,typeName="Text",time=115372353,x=0,y=0,width=200,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=32,textAlign=kAlignCenter,colorRed=80,colorGreen=80,colorBlue=80,string=[[微博]]
				}
			},
			{
				name="sms",type=0,typeName="View",time=115697788,x=0,y=212,width=200,height=182,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,
				{
					name="btn",type=2,typeName="Button",time=115697789,x=0,y=0,width=130,height=130,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="common/icon/sms.png"
				},
				{
					name="text",type=4,typeName="Text",time=115697790,x=0,y=0,width=200,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=32,textAlign=kAlignCenter,colorRed=80,colorGreen=80,colorBlue=80,string=[[短信]]
				}
			},
			{
				name="copy_url",type=0,typeName="View",time=115705077,x=0,y=212,width=200,height=182,visible=0,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,
				{
					name="btn",type=2,typeName="Button",time=115705078,x=0,y=0,width=130,height=130,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTop,file="common/icon/fzlj.png"
				},
				{
					name="text",type=4,typeName="Text",time=115705079,x=0,y=0,width=200,height=50,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignBottom,fontSize=32,textAlign=kAlignCenter,colorRed=80,colorGreen=80,colorBlue=80,string=[[复制链接]]
				}
			}
		}
	}
}