local conf = {type="skeleton", name="shouchong_ui", frameRate=24, version=1.4,
 armatures={  
    {type="armature", name="leichong_ui", 
      bones={           
           {type="b", name="hit_area", x=0, y=720, kx=0, ky=0, cx=320, cy=180, z=0, d={{name="commonBackgrounds/common_copy_hit_area", isArmature=0}} },
           {type="b", name="panel", x=205, y=621, kx=0, ky=0, cx=0.85, cy=0.81, z=1, d={{name="commonPanels/common_copy_panel_1", isArmature=0}} },
           {type="b", name="bg", x=515.8, y=563.1, kx=0, ky=0, cx=7.56, cy=5.61, z=2, d={{name="commonBackgroundScalables/common_copy_background_6", isArmature=0}} },
           {type="b", name="logo", x=482.5, y=639.65, kx=0, ky=0, cx=1, cy=1, z=3, d={{name="leichonglogo", isArmature=0}} },
           {type="b", name="common_copy_close_button", x=1110.6, y=641.5, kx=0, ky=0, cx=1, cy=1, z=4, d={{name="commonButtons/common_copy_close_button_normal", isArmature=0}} },
           {type="b", name="text1", x=521.8, y=537.4, kx=0, ky=0, cx=1, cy=1, z=5, text={x=522,y=529, w=137, h=34,lineType="single line",size=22,color="ffeace",alignment="left",space=0,textType="static"}, d={{name="commonImages/common_copy_button_bg", isArmature=0}} },
           {type="b", name="text2", x=663.8, y=537.4, kx=0, ky=0, cx=1, cy=1, z=6, text={x=664,y=529, w=49, h=34,lineType="single line",size=22,color="f02727",alignment="left",space=0,textType="static"}, d={{name="commonImages/common_copy_button_bg", isArmature=0}} },
           {type="b", name="text3", x=717.8, y=537.4, kx=0, ky=0, cx=1, cy=1, z=7, text={x=718,y=529, w=71, h=34,lineType="single line",size=22,color="ffeace",alignment="left",space=0,textType="static"}, d={{name="commonImages/common_copy_button_bg", isArmature=0}} },
           {type="b", name="text4", x=789.8, y=537.4, kx=0, ky=0, cx=1, cy=1, z=8, text={x=790,y=529, w=49, h=34,lineType="single line",size=22,color="f02727",alignment="left",space=0,textType="static"}, d={{name="commonImages/common_copy_button_bg", isArmature=0}} },
           {type="b", name="text5", x=843.8, y=537.4, kx=0, ky=0, cx=1, cy=1, z=9, text={x=844,y=529, w=291, h=34,lineType="single line",size=22,color="ffeace",alignment="left",space=0,textType="static"}, d={{name="commonImages/common_copy_button_bg", isArmature=0}} },
           {type="b", name="text6", x=521.8, y=507.4, kx=0, ky=0, cx=1, cy=1, z=10, text={x=522,y=499, w=533, h=34,lineType="single line",size=22,color="ffeace",alignment="left",space=0,textType="static"}, d={{name="commonImages/common_copy_button_bg", isArmature=0}} }
         }
      },
    {type="armature", name="render", 
      bones={           
           {type="b", name="hit_area", x=0, y=140, kx=0, ky=0, cx=149.49, cy=35, z=0, d={{name="commonBackgrounds/common_copy_hit_area", isArmature=0}} },
           {type="b", name="renderbg", x=0, y=140, kx=0, ky=0, cx=8.79, cy=2, z=1, d={{name="commonPanels/common_copy_item_bg_7", isArmature=0}} },
           {type="b", name="meihua", x=342.7, y=112, kx=0, ky=0, cx=1, cy=1, z=2, d={{name="meihua", isArmature=0}} },
           {type="b", name="target_bg", x=0, y=140, kx=0, ky=0, cx=1.52, cy=1, z=3, d={{name="commonImages/common_copy_friendNameBg", isArmature=0}} },
           {type="b", name="target", x=218.95, y=120, kx=0, ky=0, cx=1, cy=1, z=4, text={x=55,y=102, w=393, h=34,lineType="single line",size=22,color="67190e",alignment="left",space=0,textType="static"}, d={{name="commonImages/common_copy_button_bg", isArmature=0}} },
           {type="b", name="item1", x=53.5, y=102.7, kx=0, ky=0, cx=0.91, cy=0.91, z=5, d={{name="commonGrids/common_copy_grid", isArmature=0}} },
           {type="b", name="item2", x=162.65, y=102.7, kx=0, ky=0, cx=0.91, cy=0.91, z=6, d={{name="commonGrids/common_copy_grid", isArmature=0}} },
           {type="b", name="item3", x=271.85, y=102.7, kx=0, ky=0, cx=0.91, cy=0.91, z=7, d={{name="commonGrids/common_copy_grid", isArmature=0}} },
           {type="b", name="btn", x=440.75, y=81.5, kx=0, ky=0, cx=1, cy=1, z=8, d={{name="commonButtons/common_copy_small_blue_button", isArmature=1}} }
         }
      },
    {type="armature", name="commonButtons/common_copy_small_blue_button", 
      bones={           
           {type="b", name="common_small_blue_button", x=0, y=0, kx=0, ky=0, cx=1, cy=1, z=0, text={x=15,y=-43, w=101, h=36,lineType="single line",size=24,color="ffffff",alignment="center",space=0,textType="static"}, d={{name="commonButtons/common_copy_small_blue_button_normal", isArmature=0},{name="commonButtons/common_copy_small_blue_button_down", isArmature=0}} }
         }
      },
    {type="armature", name="shouchong_ui", 
      bones={           
           {type="b", name="hit_area", x=0, y=720, kx=0, ky=0, cx=320, cy=180, z=0, d={{name="commonBackgrounds/common_copy_hit_area", isArmature=0}} },
           {type="b", name="panel", x=220.1, y=604, kx=0, ky=0, cx=0.8, cy=0.8, z=1, d={{name="commonPanels/common_copy_panel_1", isArmature=0}} },
           {type="b", name="logo", x=469.8, y=629.65, kx=0, ky=0, cx=1, cy=1, z=2, d={{name="logo", isArmature=0}} },
           {type="b", name="youxia_touming", x=507.8, y=338.05, kx=0, ky=0, cx=11.72, cy=3.24, z=3, d={{name="youxia_bg", isArmature=0}} },
           {type="b", name="youshang_pic", x=506.3, y=558.65, kx=0, ky=0, cx=1, cy=1, z=4, d={{name="advertise", isArmature=0}} },
           {type="b", name="red_button", x=711.3, y=183.04999999999995, kx=0, ky=0, cx=1, cy=1, z=5, d={{name="commonButtons/common_copy_red_button", isArmature=1}} },
           {type="b", name="common_copy_close_button", x=1080.6, y=631.5, kx=0, ky=0, cx=1, cy=1, z=6, d={{name="commonButtons/common_copy_close_button_normal", isArmature=0}} },
           {type="b", name="item1", x=611.1, y=323.55, kx=0, ky=0, cx=1, cy=1, z=7, d={{name="commonGrids/common_copy_grid", isArmature=0}} },
           {type="b", name="item2", x=749.05, y=323.55, kx=0, ky=0, cx=1, cy=1, z=8, d={{name="commonGrids/common_copy_grid", isArmature=0}} },
           {type="b", name="item3", x=887, y=323.55, kx=0, ky=0, cx=1, cy=1, z=9, d={{name="commonGrids/common_copy_grid", isArmature=0}} }
         }
      },
    {type="armature", name="commonButtons/common_copy_red_button", 
      bones={           
           {type="b", name="common_red_button", x=0, y=0, kx=0, ky=0, cx=1, cy=1, z=0, text={x=9,y=-56, w=150, h=44,lineType="single line",size=30,color="ffffff",alignment="center",space=0,textType="static"}, d={{name="commonButtons/common_copy_red_button_normal", isArmature=0},{name="commonButtons/common_copy_red_button_down", isArmature=0}} }
         }
      }
}, 
 animations={  
    {type="animation", name="leichong_ui", 
      mov={
     {name="f1", dr=1, to=0, twdr=NaN, lp=NaN, twe=NaN, b={
           {name="hit_area", sc=1, dl=0, f={
                {x=0, y=720, kx=0, ky=0, cx=320, cy=180, z=0, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="panel", sc=1, dl=0, f={
                {x=205, y=621, kx=0, ky=0, cx=0.85, cy=0.81, z=1, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="bg", sc=1, dl=0, f={
                {x=515.8, y=563.1, kx=0, ky=0, cx=7.56, cy=5.61, z=2, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="logo", sc=1, dl=0, f={
                {x=482.5, y=639.65, kx=0, ky=0, cx=1, cy=1, z=3, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="common_copy_close_button", sc=1, dl=0, f={
                {x=1110.6, y=641.5, kx=0, ky=0, cx=1, cy=1, z=4, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="text1", sc=1, dl=0, f={
                {x=521.8, y=537.4, kx=0, ky=0, cx=1, cy=1, z=5, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="text2", sc=1, dl=0, f={
                {x=663.8, y=537.4, kx=0, ky=0, cx=1, cy=1, z=6, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="text3", sc=1, dl=0, f={
                {x=717.8, y=537.4, kx=0, ky=0, cx=1, cy=1, z=7, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="text4", sc=1, dl=0, f={
                {x=789.8, y=537.4, kx=0, ky=0, cx=1, cy=1, z=8, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="text5", sc=1, dl=0, f={
                {x=843.8, y=537.4, kx=0, ky=0, cx=1, cy=1, z=9, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="text6", sc=1, dl=0, f={
                {x=521.8, y=507.4, kx=0, ky=0, cx=1, cy=1, z=10, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            }
           }
         },
     {name="f10", dr=1, to=0, twdr=NaN, lp=NaN, twe=NaN, b={
           {name="bg", sc=1, dl=0, f={
                {x=515.8, y=563.1, kx=0, ky=0, cx=7.56, cy=5.61, z=0, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            }
           }
         }
        }
      },
    {type="animation", name="render", 
      mov={
     {name="f1", dr=1, to=0, twdr=NaN, lp=NaN, twe=NaN, b={
           {name="hit_area", sc=1, dl=0, f={
                {x=0, y=140, kx=0, ky=0, cx=149.49, cy=35, z=0, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="renderbg", sc=1, dl=0, f={
                {x=0, y=140, kx=0, ky=0, cx=8.79, cy=2, z=1, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="meihua", sc=1, dl=0, f={
                {x=342.7, y=112, kx=0, ky=0, cx=1, cy=1, z=2, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="target_bg", sc=1, dl=0, f={
                {x=0, y=140, kx=0, ky=0, cx=1.52, cy=1, z=3, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="target", sc=1, dl=0, f={
                {x=218.95, y=120, kx=0, ky=0, cx=1, cy=1, z=4, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="item1", sc=1, dl=0, f={
                {x=53.5, y=102.7, kx=0, ky=0, cx=0.91, cy=0.91, z=5, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="item2", sc=1, dl=0, f={
                {x=162.65, y=102.7, kx=0, ky=0, cx=0.91, cy=0.91, z=6, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="item3", sc=1, dl=0, f={
                {x=271.85, y=102.7, kx=0, ky=0, cx=0.91, cy=0.91, z=7, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="btn", sc=1, dl=0, f={
                {x=440.75, y=81.5, kx=0, ky=0, cx=1, cy=1, z=8, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            }
           }
         },
     {name="f2", dr=1, to=0, twdr=NaN, lp=NaN, twe=NaN, b={
           {name="btn", sc=1, dl=0, f={
                {x=440.75, y=81.5, kx=0, ky=0, cx=1, cy=1, z=0, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            }
           }
         }
        }
      },
    {type="animation", name="commonButtons/common_copy_small_blue_button", 
      mov={
     {name="normal", dr=1, to=0, twdr=NaN, lp=NaN, twe=NaN, b={
           {name="common_small_blue_button", sc=1, dl=0, f={
                {x=0, y=0, kx=0, ky=0, cx=1, cy=1, z=0, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            }
           }
         },
     {name="touch", dr=1, to=0, twdr=NaN, lp=NaN, twe=NaN, b={
           {name="common_small_blue_button", sc=1, dl=0, f={
                {x=0, y=0, kx=0, ky=0, cx=1, cy=1, z=0, di=1, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            }
           }
         },
     {name="disable", dr=1, to=0, twdr=NaN, lp=NaN, twe=NaN, b={
           {name="common_small_blue_button", sc=1, dl=0, f={
                {x=0, y=0, kx=0, ky=0, cx=1, cy=1, z=0, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            }
           }
         }
        }
      },
    {type="animation", name="shouchong_ui", 
      mov={
     {name="f1", dr=1, to=0, twdr=NaN, lp=NaN, twe=NaN, b={
           {name="hit_area", sc=1, dl=0, f={
                {x=0, y=720, kx=0, ky=0, cx=320, cy=180, z=0, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="panel", sc=1, dl=0, f={
                {x=220.1, y=604, kx=0, ky=0, cx=0.8, cy=0.8, z=1, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="logo", sc=1, dl=0, f={
                {x=469.8, y=629.65, kx=0, ky=0, cx=1, cy=1, z=2, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="youxia_touming", sc=1, dl=0, f={
                {x=507.8, y=338.05, kx=0, ky=0, cx=11.72, cy=3.24, z=3, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="youshang_pic", sc=1, dl=0, f={
                {x=506.3, y=558.65, kx=0, ky=0, cx=1, cy=1, z=4, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="red_button", sc=1, dl=0, f={
                {x=711.3, y=183.04999999999995, kx=0, ky=0, cx=1, cy=1, z=5, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="common_copy_close_button", sc=1, dl=0, f={
                {x=1080.6, y=631.5, kx=0, ky=0, cx=1, cy=1, z=6, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="item1", sc=1, dl=0, f={
                {x=611.1, y=323.55, kx=0, ky=0, cx=1, cy=1, z=7, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="item2", sc=1, dl=0, f={
                {x=749.05, y=323.55, kx=0, ky=0, cx=1, cy=1, z=8, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            },
           {name="item3", sc=1, dl=0, f={
                {x=887, y=323.55, kx=0, ky=0, cx=1, cy=1, z=9, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            }
           }
         },
     {name="f10", dr=1, to=0, twdr=NaN, lp=NaN, twe=NaN, b={
           }
         }
        }
      },
    {type="animation", name="commonButtons/common_copy_red_button", 
      mov={
     {name="normal", dr=1, to=0, twdr=NaN, lp=NaN, twe=NaN, b={
           {name="common_red_button", sc=1, dl=0, f={
                {x=0, y=0, kx=0, ky=0, cx=1, cy=1, z=0, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            }
           }
         },
     {name="touch", dr=1, to=0, twdr=NaN, lp=NaN, twe=NaN, b={
           {name="common_red_button", sc=1, dl=0, f={
                {x=0, y=0, kx=0, ky=0, cx=1, cy=1, z=0, di=1, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            }
           }
         },
     {name="disable", dr=1, to=0, twdr=NaN, lp=NaN, twe=NaN, b={
           {name="common_red_button", sc=1, dl=0, f={
                {x=0, y=0, kx=0, ky=0, cx=1, cy=1, z=0, di=0, dr=1, twe=NaN, twr=0, mv=nil, vi=1, evt=nil}
             }
            }
           }
         }
        }
      }
  }
}
 return conf;