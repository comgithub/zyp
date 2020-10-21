//
//  ZMBProgress.m
//  zyp
//
//  Created by 张伊朋 on 2020/10/20.
//

#import "ZMBProgress.h"
#import "UIViewController+Ext.h"
@implementation ZMBProgress

+ (void)showToastInfo:(NSString *)content
{
    UIWindow *myWindow = [[[UIApplication sharedApplication] windows]objectAtIndex:0];
    [myWindow.rootViewController E_showToastInfo:nil withContent:content onParent:myWindow];
}



+ (void) showUserDefineToast_OK:(NSString *)hintText
{
    [self showUserDefineToast_OK:hintText atHide:nil];
}

+ (void) showUserDefineToast_OK:(NSString *)hintText atHide:(void (^)(void))complete
{
    UIWindow *myWindow = [[[UIApplication sharedApplication] windows]objectAtIndex:0];
    [self showUserDefintToast:hintText
                              view:myWindow
                            // Toast消失时的回调
                            atHide:^(void){
                                // 并在Toast消失时退出添加好友界面
                                if(complete)
                                    complete();
                            }];
}


+ (void)showUserDefintToast:(NSString *)tipContent view:(UIView *)parentView atHide:(void (^)(void))complete
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:parentView animated:YES];
    // Set the custom view mode to show any view.
    hud.mode = MBProgressHUDModeCustomView;
    // Set an image view with a checkmark.
    UIImage *image = [[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    // 此值设为YES则会让底边空白变的更大
    hud.square = NO;
    // Optional label text
    hud.label.text = tipContent;

    //    [hud hideAnimated:YES afterDelay:3.f];
    double delayInSeconds = 1.5;//3.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // 隐藏
        [hud hideAnimated:YES];
        // 执行block
        if(complete)
            complete();
    });
}
@end
