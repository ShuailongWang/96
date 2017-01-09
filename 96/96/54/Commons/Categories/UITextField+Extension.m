//
//  UITextField+Extension.m
//  General
//
//  Created by WSL on 17/1/3.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "UITextField+Extension.h"

@implementation UITextField (Extension)

-(UITextField *)createTextField{
    UITextField *textField = [[UITextField alloc]init];
    
    textField.backgroundColor = [UIColor whiteColor];
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    return textField;
}
-(UIView*)creatLeftView:(NSString*)imageName{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
    imageView.image = [UIImage imageNamed:imageName];
    [view addSubview:imageView];
    
    return view;
}

//登录界面使用
-(UITextField*)initWithPlace:(NSString*)placeHolder imageName:(NSString*)imageName{
    UITextField *textField = [self createTextField];
    
    textField.placeholder = placeHolder;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.leftView = [self creatLeftView:imageName];
    
    return textField;
}

//密码框
-(UITextField*)passWithPlaceHolder:(NSString*)placeHolder imageName:(NSString*)imageName{
    UITextField *textField = [self createTextField];
    
    textField.placeholder = placeHolder;
    textField.secureTextEntry = YES;
    
    textField.leftView = [self creatLeftView:imageName];
    textField.rightView = [self creatLeftView:imageName];
    
    return textField;
}

-(UITextField*)initwithPlace:(NSString*)placeStr{
    UITextField *textField = [self createTextField];
    textField.placeholder = placeStr;
    textField.font = [UIFont systemFontOfSize:15];
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;//关闭自动大写
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    return textField;
}

@end
