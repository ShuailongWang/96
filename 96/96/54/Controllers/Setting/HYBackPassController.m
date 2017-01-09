//
//  HYBackPassController.m
//  General
//
//  Created by WSL on 17/1/5.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYBackPassController.h"

@interface HYBackPassController ()

@property (strong,nonatomic) UITextField *textfield;

@end

@implementation HYBackPassController

-(void)loadView{
    self.view = [[TPKeyboardAvoidingScrollView alloc]init];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"找回密码";
    [self setupUI];
}

-(void)setupUI{
    if (nil == _textfield) {
        _textfield = [[UITextField alloc]initWithFrame:CGRectMake(20, 20, KScreen_Width - 40, 50)];
        _textfield.backgroundColor = [UIColor whiteColor];
        _textfield.placeholder = @"输入手机号";
        _textfield.layer.borderColor = [RGB(38, 146, 100) CGColor];
        _textfield.layer.borderWidth = 1;
        _textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        //变成圆角
        _textfield.layer.cornerRadius = 5;
        _textfield.layer.masksToBounds = YES;        //把多余的删除
        [self.view addSubview:_textfield];
    }
    UIButton *sendBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, _textfield.bottom + 20, _textfield.width, 40)];
    sendBtn.backgroundColor = [UIColor redColor];
    [sendBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [sendBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //变成圆角
    sendBtn.layer.cornerRadius = 5;
    sendBtn.layer.masksToBounds = YES;        //把多余的删除
    [sendBtn addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sendBtn];
    
    UILabel *bottomLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, KScreen_Height - 114, KScreen_Width, 30)];
    bottomLabel.text = @"如需邮箱找回, 请到联系客服";
    bottomLabel.font = [UIFont systemFontOfSize:15];
    bottomLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:bottomLabel];
}

-(void)clickButton{
    NSString *tipStr;
    if (![_textfield.text isMobile]) {
        tipStr = @"手机格式不正确哟~";
    }
    
    if (tipStr) {
        [NSObject showErrorMsg:tipStr];
        return;
    }
    
    [NSObject showErrorMsg:@"服务器错误"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.navigationController popViewControllerAnimated:YES];
    });
}

@end
