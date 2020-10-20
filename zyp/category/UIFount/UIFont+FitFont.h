//
//  UIFont+FitFont.h
//  Shop
//
//  Created by 张伊朋 on 2019/3/19.
//  Copyright © 2019年 yangang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (FitFont)
+ (UIFont *)fit_configure:(CGFloat)font;
+ (UIFont *)fit_configure:(CGFloat)font style:(NSString *)style;
@end

NS_ASSUME_NONNULL_END
