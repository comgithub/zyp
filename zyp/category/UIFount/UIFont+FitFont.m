//
//  UIFont+FitFont.m
//  Shop
//
//  Created by 张伊朋 on 2019/3/19.
//  Copyright © 2019年 yangang. All rights reserved.
//

#import "UIFont+FitFont.h"

@implementation UIFont (FitFont)
+ (UIFont *)fit_configure:(CGFloat)font {
    return [self fit_configure:font style:Z_PingFangTC_Medium];
}
+ (UIFont *)fit_configure:(CGFloat)font style:(NSString *)style{
    if (Z_SCREEN_WIDTH == 320) {
        return  [UIFont fontWithName:style size:(font - 1)];
    }else if (Z_SCREEN_WIDTH == 375){
        return  [UIFont fontWithName:style size:(font)];
    }else{
        return  [UIFont fontWithName:style size:(font + 2)];
    }
}
@end
