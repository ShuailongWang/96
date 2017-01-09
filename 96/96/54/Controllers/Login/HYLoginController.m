//
//  HYLoginController.m
//  General
//
//  Created by WSL on 17/1/3.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYLoginController.h"
#import "HYRegistersController.h"
#import "HYMainTabBarController.h"

@interface HYLoginController ()

@property (strong,nonatomic) UIImageView *bgImageView;
@property (strong, nonatomic) UIButton *dismisBtn;
@property (strong, nonatomic) UITextField *userID_TF;   //用户
@property (strong, nonatomic) UITextField *password_TF;  //密码
@property (strong, nonatomic) UIButton *loginBtn;       //登录按钮
@property (strong, nonatomic) UIButton *registerButton;
@property (strong, nonatomic) UIButton *removePassButton;


@end


@implementation HYLoginController

-(void)loadView{
    TPKeyboardAvoidingScrollView *tpKeyBoardView = [[TPKeyboardAvoidingScrollView alloc]init];
    self.view = tpKeyBoardView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
}


-(void)setupUI{
    if (nil == _bgImageView) {
        _bgImageView = [[UIImageView alloc]initWithFrame:KScreen_Bounds];
        _bgImageView.image = [UIImage imageNamed:@"bgImge"];
        [self.view addSubview:_bgImageView];
    }
    if (nil == _dismisBtn) {
        _dismisBtn = [[UIButton alloc]initWithFrame:CGRectMake(KScreen_Width - 50, 30, 30, 30)];
        [_dismisBtn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        [_dismisBtn addTarget:self action:@selector(clickDisMisButton) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_dismisBtn];
    }
    if (nil == _userID_TF) {
        _userID_TF = [[UITextField alloc]initWithPlace:@"账号" imageName:@"icon_user"];
        [self.view addSubview: _userID_TF];
    }
    if (nil == _password_TF) {
        _password_TF = [[UITextField alloc]passWithPlaceHolder:@"密码" imageName:@"icon_pwd"];
        [self.view addSubview: _password_TF];
    }
    if (nil == _loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setTitle:@"登  录" forState:UIControlStateNormal];
        _loginBtn.backgroundColor = RGB(64, 153, 244);
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:24];
        _loginBtn.layer.cornerRadius = 5;
        _loginBtn.layer.masksToBounds = YES;
        [_loginBtn addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_loginBtn];
    }
    if (nil == _registerButton) {
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registerButton setTitle:@"马上注册" forState:UIControlStateNormal];
        _registerButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_registerButton addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_registerButton];
    }
    if (nil == _removePassButton) {
        _removePassButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_removePassButton setTitle:@"忘记密码?" forState:UIControlStateNormal];
        _removePassButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_removePassButton addTarget:self action:@selector(forgetPwdAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_removePassButton];
    }
    UIView *leftLineView = [[UIView alloc]init];
    leftLineView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:leftLineView];
    
    UILabel *threeLabel = [[UILabel alloc]init];
    threeLabel.text = @"第三方账号快速登陆";
    threeLabel.textColor = [UIColor grayColor];
    threeLabel.textAlignment = NSTextAlignmentCenter;
    threeLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:threeLabel];
    
    UIView *rightLineView = [[UIView alloc]init];
    rightLineView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:rightLineView];
    
    UIButton *qqBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [qqBtn setImage:[UIImage imageNamed:@"QQ_icon"] forState:UIControlStateNormal];
    [qqBtn addTarget:self action:@selector(clickThreeButton:) forControlEvents:UIControlEventTouchUpInside];
    qqBtn.tag = 100;
    [self.view addSubview:qqBtn];
    
    UIButton *weChatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [weChatBtn setImage:[UIImage imageNamed:@"Wechat_icon"] forState:UIControlStateNormal];
    [weChatBtn addTarget:self action:@selector(clickThreeButton:) forControlEvents:UIControlEventTouchUpInside];
    weChatBtn.tag = 101;
    [self.view addSubview:weChatBtn];
    
    UIButton *sinaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [sinaBtn setImage:[UIImage imageNamed:@"Sina_icon"] forState:UIControlStateNormal];
    [sinaBtn addTarget:self action:@selector(clickThreeButton:) forControlEvents:UIControlEventTouchUpInside];
    sinaBtn.tag = 102;
    [self.view addSubview:sinaBtn];
    
    [_userID_TF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.centerX.equalTo(self.view);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(KScreen_Width / 5 * 4);
    }];
    [_password_TF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userID_TF);
        make.top.equalTo(self.userID_TF.mas_bottom);
        make.right.equalTo(self.userID_TF);
        make.height.equalTo(self.userID_TF);
    }];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.password_TF.mas_bottom).offset(50);
        make.left.right.equalTo(self.password_TF);
        make.height.mas_equalTo(50);
    }];
    [_registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.loginBtn).offset(10);
        make.top.equalTo(self.loginBtn.mas_bottom).offset(5);
    }];
    [_removePassButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.loginBtn).offset(-10);
        make.top.equalTo(_registerButton);
    }];
    [qqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_bgImageView.mas_bottom).offset(-30);
        make.width.height.equalTo(@80);
        make.left.equalTo(_bgImageView).offset((KScreen_Width - 3 * 80 - 40) / 2);
    }];
    [weChatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.bottom.equalTo(qqBtn);
        make.left.equalTo(qqBtn.mas_right).offset(20);
    }];
    [sinaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.bottom.equalTo(weChatBtn);
        make.left.equalTo(weChatBtn.mas_right).offset(20);
    }];
    [leftLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(qqBtn.mas_left);
        make.bottom.equalTo(qqBtn.mas_top).offset(-5);
        make.height.equalTo(@2);
        make.width.equalTo(qqBtn);
    }];
    [threeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leftLineView.mas_right).offset(5);
        make.centerY.equalTo(leftLineView.mas_centerY);
    }];
    [rightLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(threeLabel.mas_right).offset(5);
        make.right.equalTo(sinaBtn.mas_right);
        make.bottom.equalTo(leftLineView);
        make.height.equalTo(@2);
    }];
    

}

//点击关闭按钮
-(void)clickDisMisButton{
    [self dismissViewControllerAnimated:YES completion:nil];
}
//注册按钮
-(void)registerAction:(UIButton*)sender{

    HYRegistersController *registerVC = [[HYRegistersController alloc]init];
    registerVC.myBlock = ^(NSString *str){
        self.userID_TF.text = str;
    };
    [self presentViewController:registerVC animated:YES completion:nil];
}
-(void)forgetPwdAction:(UIButton*)sender{
    
}
//登录按钮
- (void)loginAction:(id)sender {
    
    NSString *tipString;
    
    //判断账号密码是否为空
    if (self.userID_TF.text.length == 0) {
        tipString = @"请输入用户名";
    }else if (self.password_TF.text.length == 0) {
        tipString = @"请输入密码";
    }
    
    if (tipString) {
        //提示
        [NSObject showErrorMsg:tipString];
        return;
    }
    
    
    [SVProgressHUD show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [SVProgressHUD dismiss];
        
        [NSObject showSuccessMsg:@"登陆成功"];
        
        // 切换应用程序主窗口的根控制器
        [UIApplication sharedApplication].keyWindow.rootViewController = [[HYMainTabBarController alloc] init];
    });
}

-(void)dealloc{
    [SVProgressHUD dismiss];
}

-(void)clickThreeButton:(UIButton*)sender{
    
}

@end
