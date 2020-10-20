//
//  Language.h
//  zyp
//
//  Created by 张伊朋 on 2020/10/19.
//
#define Z_String(key) getLocalizationString(key)
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Language : NSObject
NSString* getLocalizationString(NSString *key);
@end

NS_ASSUME_NONNULL_END
