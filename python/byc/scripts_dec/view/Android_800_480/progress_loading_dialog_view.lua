progress_loading_dialog_view=
{
	name="progress_loading_dialog_view",type=0,typeName="View",time=0,x=0,y=0,width=0,height=0,visible=1,fillParentWidth=1,fillParentHeight=1,nodeAlign=kAlignTopLeft,
	{
		name="progress_content_view",type=0,typeName="View",time=1737587,x=0,y=0,width=280,height=188,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignCenter,
		{
			name="progress_context_bg",type=1,typeName="Image",time=1737613,x=0,y=0,width=280,height=188,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="drawable/loading_bg.png",gridLeft=16,gridRight=16,gridTop=16,gridBottom=16
		},
		{
			name="progress_loading_img",type=1,typeName="Image",time=3296452,x=89,y=87,width=100,height=100,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="drawable/loading.png"
		},
		{
			name="progress_message_text",type=5,typeName="TextView",time=3307370,x=25,y=33,width=240,height=60,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,fontSize=20,textAlign=kAlignCenter,colorRed=255,colorGreen=255,colorBlue=255,string=[[正在努力加载数据...]]
		},
		{
			name="progress_cancel_btn",type=2,typeName="Button",time=3309852,x=247,y=1,width=32,height=32,visible=1,fillParentWidth=0,fillParentHeight=0,nodeAlign=kAlignTopLeft,file="drawable/loading_cancel.png"
		}
	}
}