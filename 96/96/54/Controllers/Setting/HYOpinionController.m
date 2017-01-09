//
//  HYOpinionController.m
//  General
//
//  Created by WSL on 17/1/5.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYOpinionController.h"

@interface HYOpinionController ()

@property (strong,nonatomic) UITextView *myTextView;
@property (strong,nonatomic) UITextField *subtextField;

@end

@implementation HYOpinionController

-(void)loadView{
    TPKeyboardAvoidingScrollView *scrollView = [[TPKeyboardAvoidingScrollView alloc]init];
    self.view = scrollView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    

    [self setupUI];
}

-(void)setupUI{
    UIButton *sendBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    [sendBtn setTitle:@"提交" forState:UIControlStateNormal];
    [sendBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [sendBtn addTarget:self action:@selector(clickSendBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:sendBtn];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width/2, 40)];
    titleLabel.text = @"意见反馈";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor redColor];
    self.navigationItem.titleView = titleLabel;
    
    if (nil == _myTextView) {
        _myTextView = [[UITextView alloc]initWithFrame:CGRectMake(10, 10, KScreen_Width - 20, KScreen_Height/3)];
        _myTextView.placeholder = @"如您遇到问题, 请留下您的宝贵意见和联系方式.";
        _myTextView.limitLength = @200;
        [self.view addSubview:_myTextView];
    }
    if (nil == _subtextField) {
        _subtextField = [[UITextField alloc]initWithFrame:CGRectMake(10, _myTextView.bottom + 10, KScreen_Width - 20, 30)];
        _subtextField.placeholder = @"手机号, 邮箱或者QQ";
        _subtextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _subtextField.backgroundColor = [UIColor whiteColor];
        _subtextField.font = [UIFont systemFontOfSize:16];
        [self.view addSubview:_subtextField];
    }
    UILabel *bottomLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, KScreen_Height - 114, KScreen_Width, 30)];
    bottomLabel.text = @"如有疑问, 欢迎联系客服: 1234567890";
    bottomLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:bottomLabel];
}

-(void)clickSendBtn{
    NSString *tipStr;
    if (self.myTextView.text.length == 0) {
        tipStr = @"请输入反馈内容~";
    }else if(self.subtextField.text.length == 0) {
        tipStr = @"请留下联系方式";
    }
    
    if (tipStr) {
        [NSObject showErrorMsg:tipStr];
        return;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [NSObject showSuccessMsg:@"提交成功~"];
        
        [self.navigationController popViewControllerAnimated:YES];
    });
}

@end
