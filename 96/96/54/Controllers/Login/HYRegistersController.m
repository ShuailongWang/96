//
//  HYRegistersController.m
//  General
//
//  Created by admin on 17/1/5.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYRegistersController.h"
#import "HYRegisterBtn.h"

@interface HYRegistersController ()

@property (nonatomic, strong)  UIImageView *bgImageView;
@property (nonatomic, strong)  UIButton    *dismisBtn;
@property (nonatomic, strong)  UITextField *userName;
@property (nonatomic, strong)  UITextField *passField;
@property (nonatomic, strong)  UITextField *okPassField;
@property (nonatomic, strong)  UITextField *companyField;
@property (nonatomic, strong)  UITextField *contactName;
@property (nonatomic, strong)  UITextField *phoneField;
@property (nonatomic, strong)  UITextField *emailField;
@property (nonatomic, strong)  UIButton    *registerBtn;

@property (nonatomic, strong)  HYRegisterBtn *yeyBtn;
@property (nonatomic, strong)  HYRegisterBtn *forginBtn;
@property (nonatomic, strong)  HYRegisterBtn *schoolBtn;
@property (nonatomic, strong)  HYRegisterBtn *gysBtn;
@property (nonatomic, strong)  HYRegisterBtn *chinaBtn;
@property (nonatomic, strong)  UIButton *regisBtn;
@property (nonatomic, strong)  UILabel *regisLabel;
@property (nonatomic, strong)  HYRegisterBtn *oldBtn;

@end

@implementation HYRegistersController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    [self setupUI];
}


-(void)setupUI{
    CGFloat leftMargin = 20;
    CGFloat width = 80;
    CGFloat height = 30;
    CGFloat textWitdh = KScreen_Width - leftMargin - width - 5 - 20;
    CGFloat y = 100;
    if (nil == _bgImageView) {
        _bgImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
        _bgImageView.image = [UIImage imageNamed:@"bgImge"];
        [self.view addSubview:_bgImageView];
    }
    if (nil == _dismisBtn) {
        _dismisBtn = [[UIButton alloc]initWithFrame:CGRectMake(KScreen_Width - 50, 30, 30, 30)];
        [_dismisBtn setBackgroundImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        [_dismisBtn addTarget:self action:@selector(clickDisMisButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_dismisBtn];
    }
    UILabel *userLabel = [UILabel labelWithTitle:@"用户名: " fontSize:17 textColor: [UIColor whiteColor] textAlignment:NSTextAlignmentLeft];
    userLabel.frame = CGRectMake(leftMargin, y, width, height);
    [self.view addSubview:userLabel];
    //
    UILabel *passLabel = [UILabel labelWithTitle:@"密码: " fontSize:17 textColor: [UIColor whiteColor] textAlignment:NSTextAlignmentLeft];
    passLabel.frame = CGRectMake(leftMargin, userLabel.bottom + 10, width, height);
    [self.view addSubview:passLabel];
    //
    UILabel *okPassLabel = [UILabel labelWithTitle:@"确认密码: " fontSize:17 textColor: [UIColor whiteColor] textAlignment:NSTextAlignmentLeft];
    okPassLabel.frame = CGRectMake(leftMargin, passLabel.bottom + 10, width, height);
    [self.view addSubview:okPassLabel];
    //
    UILabel *typeLabel = [UILabel labelWithTitle:@"类别: " fontSize:17 textColor: [UIColor whiteColor] textAlignment:NSTextAlignmentLeft];
    typeLabel.frame = CGRectMake(leftMargin, okPassLabel.bottom + 10, width, height);
    [self.view addSubview:typeLabel];

    
    
    if (nil == _userName) {
        _userName = [[UITextField alloc]initwithPlace:@"用户名"];
        _userName.frame = CGRectMake(userLabel.right + 5, y, textWitdh, height);
        [self.view addSubview:_userName];
    }
    if (nil == _passField) {
        _passField = [[UITextField alloc]initwithPlace:@"密码"];
        _passField.secureTextEntry = YES;
        _passField.frame = CGRectMake(userLabel.right + 5, _userName.bottom + 10, textWitdh, height);
        [self.view addSubview:_passField];
    }
    if (nil == _okPassField) {
        _okPassField = [[UITextField alloc]initwithPlace:@"确认密码"];
        _okPassField.secureTextEntry = YES;
        _okPassField.frame = CGRectMake(userLabel.right + 5, _passField.bottom + 10, textWitdh, height);
        [self.view addSubview:_okPassField];
    }
    CGFloat buttonWidth = (textWitdh - 20)/3;
    if (nil == _yeyBtn) {
        _yeyBtn = [self createButton];
        _yeyBtn.frame = CGRectMake(userLabel.right + 5, _okPassField.bottom + 10, buttonWidth, 30);
        [_yeyBtn setTitle:@"幼儿园" forState:UIControlStateNormal];
        [_yeyBtn addTarget:self action:@selector(clickTypeButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_yeyBtn];
    }
    if (nil == _forginBtn) {
        _forginBtn = [self createButton];
        _forginBtn.frame = CGRectMake(_yeyBtn.right + 5, _okPassField.bottom + 10, buttonWidth, 30);
        [_forginBtn setTitle:@"外教" forState:UIControlStateNormal];
        [_forginBtn addTarget:self action:@selector(clickTypeButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_forginBtn];
    }
    if (nil == _schoolBtn) {
        _schoolBtn = [self createButton];
        _schoolBtn.frame = CGRectMake(_forginBtn.right + 5, _okPassField.bottom + 10, buttonWidth, 30);
        [_schoolBtn setTitle:@"学校" forState:UIControlStateNormal];
        [_schoolBtn addTarget:self action:@selector(clickTypeButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_schoolBtn];
    }
    if (nil == _gysBtn) {
        _gysBtn = [self createButton];
        _gysBtn.frame = CGRectMake(userLabel.right + 5, _yeyBtn.bottom + 10, buttonWidth, 30);
        [_gysBtn setTitle:@"供应商" forState:UIControlStateNormal];
        [_gysBtn addTarget:self action:@selector(clickTypeButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_gysBtn];
    }
    if (nil == _chinaBtn) {
        _chinaBtn = [self createButton];
        _chinaBtn.frame = CGRectMake(_gysBtn.right + 5, _yeyBtn.bottom + 10, buttonWidth, 30);
        [_chinaBtn setTitle:@"中教" forState:UIControlStateNormal];
        [_chinaBtn addTarget:self action:@selector(clickTypeButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_chinaBtn];
    }
    //
    UILabel *companyLabel = [UILabel labelWithTitle:@"组织架构: " fontSize:17 textColor: [UIColor whiteColor] textAlignment:NSTextAlignmentLeft];
    companyLabel.frame = CGRectMake(leftMargin, _chinaBtn.bottom + 10, width, height);
    [self.view addSubview:companyLabel];
    //
    UILabel *contactLabel = [UILabel labelWithTitle:@"联系人: " fontSize:17 textColor: [UIColor whiteColor] textAlignment:NSTextAlignmentLeft];
    contactLabel.frame = CGRectMake(leftMargin, companyLabel.bottom + 10, width, height);
    [self.view addSubview:contactLabel];
    //
    UILabel *phoneLabel = [UILabel labelWithTitle:@"电话号码: " fontSize:17 textColor: [UIColor whiteColor] textAlignment:NSTextAlignmentLeft];
    phoneLabel.frame = CGRectMake(leftMargin, contactLabel.bottom + 10, width, height);
    [self.view addSubview:phoneLabel];
    //
    UILabel *emailLabel = [UILabel labelWithTitle:@"邮箱: " fontSize:17 textColor: [UIColor whiteColor] textAlignment:NSTextAlignmentLeft];
    emailLabel.frame = CGRectMake(leftMargin, phoneLabel.bottom + 10, width, height);
    [self.view addSubview:emailLabel];
    
    if (nil == _companyField) {
        _companyField = [[UITextField alloc]initwithPlace:@"公司/学校/个人"];
        _companyField.frame = CGRectMake(userLabel.right + 5, _chinaBtn.bottom + 10, textWitdh, height);
        [self.view addSubview:_companyField];
    }
    if (nil == _contactName) {
        _contactName = [[UITextField alloc]initwithPlace:@"联系人"];
        _contactName.frame = CGRectMake(userLabel.right + 5, _companyField.bottom + 10, textWitdh, height);
        [self.view addSubview:_contactName];
    }
    if (nil == _phoneField) {
        _phoneField = [[UITextField alloc]initwithPlace:@"电话号码"];
        _phoneField.keyboardType = UIKeyboardTypeNumberPad;
        _phoneField.frame = CGRectMake(userLabel.right + 5, _contactName.bottom + 10, textWitdh, height);
        [self.view addSubview:_phoneField];
    }
    if (nil == _emailField) {
        _emailField = [[UITextField alloc]initwithPlace:@"邮箱"];
        _emailField.frame = CGRectMake(userLabel.right + 5, _phoneField.bottom + 10, textWitdh, height);
        [self.view addSubview:_emailField];
    }
    if (nil == _regisBtn) {
        _regisBtn = [[UIButton alloc]initWithFrame:CGRectMake(leftMargin, _emailField.bottom + 40, KScreen_Width - leftMargin * 2, 40)];
        [_regisBtn setTitle:@"注 册" forState:UIControlStateNormal];
        _regisBtn.backgroundColor = RGB(64, 153, 244);
        _regisBtn.titleLabel.font = [UIFont systemFontOfSize:24];
        _regisBtn.layer.cornerRadius = 5;
        _regisBtn.layer.masksToBounds = YES;
        [_regisBtn addTarget:self action:@selector(regisAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_regisBtn];
    }
    if (nil == _regisLabel) {
        _regisLabel = [UILabel labelWithTitle:@"" fontSize:15 textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentCenter];
        _regisLabel.frame = CGRectMake(_regisBtn.x, _regisBtn.bottom + 5, _regisBtn.width, 20);
        NSMutableAttributedString *content = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"点击注册代表你已经阅读并同意<***协议>"]];
        NSRange contentRange = {0,[content length]};
        [content addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:contentRange];
        
        _regisLabel.attributedText = content;
        [self.view addSubview:_regisLabel];
    }
    
}
-(HYRegisterBtn*)createButton{
    HYRegisterBtn *button = [HYRegisterBtn buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"type_off"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"type_on"] forState:UIControlStateSelected];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    return button;
}



//点解类别按钮
-(void)clickTypeButton:(HYRegisterBtn*)sender{
    if (self.oldBtn == sender) {
        return;
    }else{
        self.oldBtn.selected = NO;
    }
    sender.selected = YES;
    self.oldBtn = sender;
}


//点击关闭按钮
- (void)clickDisMisButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
//点击注册按钮
- (void)regisAction:(UIButton *)sender {
    NSString *tipStr;
    if (self.userName.text.length == 0 ) {
        tipStr = @"用户名不能为空";
    }else if (self.passField.text.length == 0 ) {
        tipStr = @"密码不能为空";
    }else if (self.passField.text.length < 6 || self.passField.text.length > 20) {
        tipStr = @"密码为6-20位字母、数字组合";
    }else if (self.okPassField.text.length == 0 ) {
        tipStr = @"确认密码不能为空";
    }else if([self.passField.text isEqualToString:self.okPassField.text]){
        tipStr = @"密码不一致";
    }else if (self.companyField.text.length == 0 ) {
        tipStr = @"公司名称不能为空";
    }else if (self.contactName.text.length == 0 ) {
        tipStr = @"联系人不能为空";
    }else if (self.phoneField.text.length == 0 ) {
        tipStr = @"电话不能为空";
    }else if ([self.phoneField.text isMobile]) {
        tipStr = @"电话格式不正确";
    }else if (self.emailField.text.length == 0 ) {
        tipStr = @"邮箱不能为空";
//    }else if ([self.emailField.text isValidateEmail] ) {
//        tipStr = @"邮箱格式不正确";
    }else{
        if (!self.yeyBtn.selected && !self.forginBtn.selected && !self.schoolBtn.selected && !self.gysBtn.selected && !self.chinaBtn.selected) {
            tipStr = @"类别必须选择一项";
        }
    }
    if (tipStr) {
        [NSObject showErrorMsg:tipStr];
        return;
    }
    
    //
    [self.view endEditing:YES];
    [SVProgressHUD showWithStatus:@"正在注册..."];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //弹框消失
        [SVProgressHUD dismiss];
        
        [NSObject showSuccessMsg:@"恭喜你,注册成功!"];
        
        if (self.myBlock) {
            self.myBlock(self.userName.text);
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
    });
    
}

-(void)dealloc{
    DLog(@"注册销毁");
    [SVProgressHUD dismiss];
}
@end
