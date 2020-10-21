//
//  ViewController.h
//  zyp
//
//  Created by 张伊朋 on 2020/10/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewController : UIViewController<UITextFieldDelegate>
/** 登陆区号 */
@property (strong, nonatomic)  UITextField *loginPhoneArea;
/** 登陆名 */
@property (strong, nonatomic)  UITextField *loginName;
/** 登陆密码 */
@property (strong, nonatomic)  UITextField *loginPsw;

@property (strong,nonatomic) NSString *phoneArea;

@end

NS_ASSUME_NONNULL_END
