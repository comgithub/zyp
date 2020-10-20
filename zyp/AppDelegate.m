//
//  AppDelegate.m
//  zyp
//
//  Created by 张伊朋 on 2020/10/19.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:Z_LanguageKey] && ![[[NSUserDefaults standardUserDefaults] objectForKey:Z_LanguageKey] isEqualToString:@""]) {

        [[NSUserDefaults standardUserDefaults] setObject:[[NSUserDefaults standardUserDefaults] objectForKey:Z_LanguageKey] forKey:Z_LanguageKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:Z_zh_Hans forKey:Z_LanguageKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    ViewController *vc = [[ViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController =nav ;
    [self.window makeKeyAndVisible];
    return YES;
}




@end
