//
//  HYWebViewController.m
//  96
//
//  Created by admin on 17/1/20.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYWebViewController.h"
#import <WebKit/WebKit.h>

@interface HYWebViewController ()

@property (nonatomic, strong) WKWebView *wkWebView;

@end

@implementation HYWebViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"详情";
    _wkWebView = [[WKWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_wkWebView];
    
    [_wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.strUrl]]];
}


-(void)setStrUrl:(NSString *)strUrl{
    _strUrl = strUrl;
}



@end
