//
//  ViewController.m
//  zyp
//
//  Created by 张伊朋 on 2020/10/19.
//

#import "ViewController.h"
#import "XWCountryCodeController.h"
@interface ViewController ()
@property (strong,nonatomic)dispatch_source_t sourceTimer;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:34/255.0 green:165/255.0 blue:166/255.0 alpha:1];
    self.title =Z_String(@"Login");
    [self initWithLoginView];
}

-(void)initWithLoginView{
    
    
    for (int i = 0; i < 3; i++) {
        
        UIView *line= [[UIView alloc]init];
        line.backgroundColor = Z_Color_Line;
        [self.view addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(Z_SXRealValue(50));
                make.top.mas_equalTo(Z_NAVIGATION_BAR_HEIGHT+Z_SYRealValue(80)+Z_SYRealValue(60)+i*Z_SYRealValue(60));
                make.right.mas_equalTo(-Z_SXRealValue(50));
                make.height.mas_equalTo(1);
        
        }];
       
        UITextField *field = [[UITextField alloc]init];
        field.textColor =UIColor.blackColor;
        field.font = Z_Font_Size(15);
        [self.view addSubview:field];
       
        if (i==0) {
            field.text = [NSString stringWithFormat:@"%@(+86)",Z_String(@"Chian")];
            field.enabled = NO;
            self.loginPhoneArea =field;
            UIButton *btnPhoneArea = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.view  addSubview:btnPhoneArea];
            [btnPhoneArea addTarget:self action:@selector(getBtnCode:) forControlEvents:UIControlEventTouchUpInside];
            [btnPhoneArea mas_makeConstraints:^(MASConstraintMaker *make) {
            
                make.top.mas_equalTo(field.mas_top);
                make.bottom.mas_equalTo(field.mas_bottom);
                make.left.mas_equalTo(field.mas_left);
                make.right.mas_equalTo(field.mas_right);
            }];
                               
        }else if (i==1){
    
            field.placeholder = Z_String(@"Please input Username");
            field.keyboardType = UIKeyboardTypeNumberPad;
            field.delegate = self;
            self.loginName =field;
            
        }else if (i==2){
            field.placeholder = Z_String(@"Please enter password");
            field.keyboardType = UIKeyboardTypeASCIICapable;
             field.secureTextEntry = YES;
            field.delegate = self;
              field.returnKeyType = UIReturnKeyGo;
             self.loginPsw =field;
            
        }
           [field mas_makeConstraints:^(MASConstraintMaker *make) {
               make.left.mas_equalTo(line.mas_left);
               make.bottom.mas_equalTo(line.mas_bottom);
               make.right.mas_equalTo(line.mas_right);
               make.height.mas_equalTo(Z_SYRealValue(40));
           }];
    }
    
    UIButton *loginButton = [[UIButton alloc]init];
    [loginButton setTitle:Z_String(@"Login") forState:UIControlStateNormal];
    loginButton.titleLabel.font = Z_Font_Size(16);
    loginButton.layer.cornerRadius = 20;
    [loginButton addTarget:self action:@selector(signIn:) forControlEvents:UIControlEventTouchUpInside];
    loginButton.backgroundColor  =Z_Color_App;
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:loginButton];
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(Z_SXRealValue(60));
        make.top.mas_equalTo(Z_NAVIGATION_BAR_HEIGHT+Z_SYRealValue(80)+3*Z_SYRealValue(60)+Z_SYRealValue(40));
        make.right.mas_equalTo(-Z_SXRealValue(60));
        make.height.mas_equalTo(40);
        }];

    UILabel *termLsLabel = [[UILabel alloc]init];
    termLsLabel.text = Z_String(@"Language");
    termLsLabel.textColor =Z_Color_App;
    termLsLabel.font = [UIFont systemFontOfSize:14];
    termLsLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:termLsLabel];
    [termLsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(-Z_BOTTOM_BAR_HEIGHT);
    }];
    
    UIButton *touchButton = [[UIButton alloc]init];
    [touchButton addTarget:self action:@selector(touchButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:touchButton];
    [touchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(termLsLabel);
    }];

}
-(void)signIn:(UIButton *)button{
//    [ZMBProgress showToastInfo:@"登录成功"];
    [self beginLogin];
}

- (void)beginLogin
{
    NSString *loginName = self.loginName.text;
    NSString *loginPsw = self.loginPsw.text;

    //** 登陆名的非空验证
    if ([loginName length] == 0)
    {
        [ZMBProgress showToastInfo:@"请输入账号！"];
        
        return;
    }

    //** 登陆密码的非空验证
    if ([loginPsw length] == 0)
    {
        [ZMBProgress showToastInfo:@"请输入登陆密码！"];
        return;
    }

   
    [self.view endEditing:YES];
    // 提交用户登陆信息认证和版本检查
    [self createDispatch_source_t];
 
    [MBProgressHUD showHUDAddedTo:self.view  animated:YES];


}
/*GCD定时器*/

-(void)createDispatch_source_t{
    //创建全局队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //使用全局队列创建计时器
    _sourceTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //定时器延迟时间
    NSTimeInterval delayTime = 1.0f;
    //定时器间隔时间
    NSTimeInterval timeInterval = 1.0f;
    //设置开始时间
    dispatch_time_t startDelayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC));
    //设置计时器
    dispatch_source_set_timer(_sourceTimer,startDelayTime,timeInterval*NSEC_PER_SEC,0.1*NSEC_PER_SEC);
    //执行事件
    dispatch_source_set_event_handler(_sourceTimer,^{
        //销毁定时器
        dispatch_source_cancel(self->_sourceTimer);
        dispatch_async(dispatch_get_main_queue(),^{
            [MBProgressHUD hideHUDForView:self.view animated:NO];
            [ZMBProgress showToastInfo:@"登录成功"];
        });
    });
    
    //启动计时器
    dispatch_resume(_sourceTimer);
}
-(void)changeLanguage:(NSString *)language
{

[[NSUserDefaults standardUserDefaults] setObject:language forKey:Z_LanguageKey];
[[NSUserDefaults standardUserDefaults] synchronize];
    ViewController *tab = [[ViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:tab];
    [[[UIApplication sharedApplication] windows] objectAtIndex:0].rootViewController = nav;
    [[[[UIApplication sharedApplication] windows] objectAtIndex:0] makeKeyAndVisible];

}
-(void)touchButtonClicked {

    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:Z_String(@"Language") message:nil preferredStyle:UIAlertControllerStyleActionSheet];

    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:Z_String(@"Simplified") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        [self changeLanguage:Z_zh_Hans];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:Z_String(@"Traditional") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        [self changeLanguage:Z_zh_Hant];
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:Z_String(@"English") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        [self changeLanguage:Z_en];
    }];
    UIAlertAction *action4 = [UIAlertAction actionWithTitle:Z_String(@"Japanese") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        [self changeLanguage:Z_ja];
    }];
    UIAlertAction *action5 = [UIAlertAction actionWithTitle:Z_String(@"Korean") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        [self changeLanguage:Z_ko];
    }];
    UIAlertAction *action6 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
     
    }];

    [actionSheet addAction:action1];
    [actionSheet addAction:action2];
    [actionSheet addAction:action3];
    [actionSheet addAction:action4];
    [actionSheet addAction:action5];
    [actionSheet addAction:action6];
  
    [self presentViewController:actionSheet animated:YES completion:nil];
}

-(void)getBtnCode:(id)sender
{
            XWCountryCodeController *countryCodeVC = [[XWCountryCodeController alloc] init];
            __weak __typeof(self)weakSelf = self;
            countryCodeVC.returnCountryCodeBlock = ^(NSString *countryName, NSString *code) {

            __strong __typeof(weakSelf) strongSelf = weakSelf;
            strongSelf->_loginPhoneArea.text = [NSString stringWithFormat:@"%@(+%@)",countryName,code];
            strongSelf->_phoneArea =[NSString stringWithFormat:@"+%@",code];

            };
            countryCodeVC.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:countryCodeVC  animated:YES completion:nil];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
  
    
    [self.view endEditing:YES];

    
}
@end
