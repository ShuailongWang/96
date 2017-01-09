//
//  UITextField+Extension.h
//  General
//
//  Created by WSL on 17/1/3.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Extension)

//登录界面使用
-(UITextField*)initWithPlace:(NSString*)placeHolder imageName:(NSString*)imageName;
//密码框
-(UITextField*)passWithPlaceHolder:(NSString*)placeHolder imageName:(NSString*)imageName;
-(UITextField*)initwithPlace:(NSString*)placeStr;

@end
