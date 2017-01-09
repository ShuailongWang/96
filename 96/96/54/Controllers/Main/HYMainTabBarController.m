//
//  HYMainTabBarController.m
//  General
//
//  Created by WSL on 17/1/3.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYMainTabBarController.h"
#import "HYMainNavController.h"
#import "HYHomeController.h"
#import "HYUploadController.h"
#import "HYNewsController.h"
#import "HYMineController.h"

@interface HYMainTabBarController ()

@end

@implementation HYMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addChildViewController:[[HYHomeController alloc]init] ImageName:@"home" title:@"首页"];
    [self addChildViewController:[[HYUploadController alloc]init] ImageName:@"upload" title:@"发布"];
    [self addChildViewController:[[HYNewsController alloc]init] ImageName:@"message" title:@"消息"];
    [self addChildViewController:[[HYMineController alloc]init] ImageName:@"me" title:@"个人中心"];
}

//添加控制器
-(void)addChildViewController:(UIViewController *)childController ImageName:(NSString*)imageName title:(NSString*)title{
    //  设置图片
    childController.tabBarItem.image = [UIImage imageNamed:imageName];
    //  修改渲染模式
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imageName]];
    childController.tabBarItem.selectedImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //  设置标题
    childController.title = title;
    //  设置文字颜色
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} forState:UIControlStateSelected];
    //  设置字体大小
    [childController.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateNormal];
    [self addChildViewController:childController];
    
    //  添加到导航控制器
    HYMainNavController *hyNVC = [[HYMainNavController alloc]initWithRootViewController:childController];
    
    //  给当前对象添加子视图控制器
    [self addChildViewController:hyNVC];
    
}

@end
