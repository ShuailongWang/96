//
//  HYMainNavController.m
//  General
//
//  Created by WSL on 17/1/3.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYMainNavController.h"

@interface HYMainNavController ()

@end

@implementation HYMainNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    // 如果现在push的不是栈底控制器(最先push进来的那个控制器)
    if (self.viewControllers.count > 0) {
        //自动隐藏tabbar
        [viewController setHidesBottomBarWhenPushed:YES];
        
        //在上一级控制器,设置返回文字
        self.topViewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    }
    [super pushViewController:viewController animated:animated];
}

@end
