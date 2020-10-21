//
//  ZMBProgress.h
//  zyp
//
//  Created by 张伊朋 on 2020/10/20.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZMBProgress : NSObject
+ (void)showToastInfo:(NSString *)content;

// 显示一个延迟关闭的大提示Toast，Toast类型是OK。
+ (void) showUserDefineToast_OK:(NSString *)hintText;
+ (void) showUserDefineToast_OK:(NSString *)hintText atHide:(void (^)(void))complete;

/**
 显示一个可以定义图标和文本内容的Toast。

 @param tipContent 文本内容
 @param parentView 父view
 @param complete 在Toast消失时执行时block，可为nil
 */
+ (void)showUserDefintToast:(NSString *)tipContent view:(UIView *)parentView atHide:(void (^)(void))complete;
@end

NS_ASSUME_NONNULL_END
