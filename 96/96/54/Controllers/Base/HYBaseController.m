//
//  HYBaseController.m
//  General
//
//  Created by WSL on 17/1/3.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYBaseController.h"
#import "HYLoginController.h"
#import "HYMainNavController.h"

@interface HYBaseController ()

@end

@implementation HYBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //背景颜色
    self.view.backgroundColor = kBagroundColor;
    
    [self addGesture];
}

#pragma mark - 给屏幕添加手势,点击后回收键盘
-(void)addGesture{
    if (self.isEndEdit) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(endEditAction)];
        tap.cancelsTouchesInView = YES;
        [self.view addGestureRecognizer:tap];
    }
}
//回收键盘
- (void)endEditAction {
    [self.view endEditing:YES];
}

#pragma mark - 弹出登录界面
- (void)pushLoginViewController {
    
    //登录界面
    HYLoginController *loginVC = [[HYLoginController alloc] init];
    HYMainNavController *loginNav = [[HYMainNavController alloc] initWithRootViewController:loginVC];
    [self presentViewController:loginNav animated:YES completion:nil];
}

@end
