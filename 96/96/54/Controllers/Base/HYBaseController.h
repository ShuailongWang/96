//
//  HYBaseController.h
//  General
//
//  Created by WSL on 17/1/3.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYBaseController : UIViewController

@property (assign, nonatomic) BOOL isEndEdit;   //编辑界面


//跳转到登录界面
- (void)pushLoginViewController;

@end
