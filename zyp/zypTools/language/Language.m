//
//  Language.m
//  zyp
//
//  Created by 张伊朋 on 2020/10/19.
//

#import "Language.h"

@implementation Language
NSString* getLocalizationString(NSString *key){
//文件名 = 语言代码 + .lproj
NSString *appLanguage = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:Z_LanguageKey]];
NSString *path = [[NSBundle mainBundle] pathForResource:appLanguage ofType:@"lproj"];
//获取对应语言的字符串
// testText 文本的key
// localizedStrings 是.strings文件的文件名
NSString *realString = [[NSBundle bundleWithPath:path] localizedStringForKey:key value:nil table:@"File"];
    if (!realString) {
        return @"语言错误";
    }
    return realString;
}
@end
