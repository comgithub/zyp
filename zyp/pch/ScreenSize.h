//
//  ScreenSize.pch
//  zyp
//
//  Created by 张伊朋 on 2020/10/19.
//

//  自适应宽度和高度
#define Z_SCREEN_WIDTH    [UIScreen mainScreen].bounds.size.width
#define Z_SCREEN_HEIGHT   [UIScreen mainScreen].bounds.size.height

//自适应宽高
#define Z_SXRealValue(value) ((value)/375.0f*[UIScreen mainScreen].bounds.size.width)
#define Z_SYRealValue(value) ((value)/667.0f*[UIScreen mainScreen].bounds.size.height)



#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define  isIphoneX_XS     (Z_SCREEN_WIDTH == 375.f && Z_SCREEN_HEIGHT == 812.f ? YES : NO)
#define  isIphoneXR_XSMax    (Z_SCREEN_WIDTH == 414.f && Z_SCREEN_HEIGHT == 896.f ? YES : NO)

//异性全面屏
#define   isFullScreen    (isIphoneX_XS || isIphoneXR_XSMax)


//状态栏高度
#define Z_STATUS_BAR_HEIGHT (isFullScreen ? 44.f : 20.f)
//状态栏+导航高度
#define Z_NAVIGATION_BAR_HEIGHT (isFullScreen ? 88 : 64)
//距离底部高度
#define Z_BOTTOM_BAR_HEIGHT (isFullScreen ? 34 : 0)
//Tabbar高度
#define Z_TAB_BAR_HEIGHT (isFullScreen ? 83.f : 49.f)


