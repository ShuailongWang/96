//
//  ProductNewDetailViewController.m
//  96
//
//  Created by admin on 17/1/11.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "ProductNewDetailViewController.h"

@interface ProductNewDetailViewController ()<UIScrollViewDelegate>

//------------滚动文字与操作控制用的属性----------//
@property (strong, nonatomic) UIScrollView *ScrollView;
@property (strong, nonatomic) UIScrollView *TopView;
@property (strong, nonatomic) UIScrollView *BottomView;

@property (strong, nonatomic) UILabel *TopViewLabel;
@property (strong, nonatomic) UILabel *BottomViewLabel;

@end

@implementation ProductNewDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.ScrollView addSubview:self.TopView];
    [self.ScrollView addSubview:self.BottomView];
    
    
}


#pragma mark - 滚动文字与操作控制
//文字显示
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //上拉
    if (scrollView == self.TopView)
    {
        if ( scrollView.contentOffset.y >= (self.TopView.contentSize.height-self.TopView.frame.size.height + 100))
        {
            self.TopViewLabel.text = @"可以松开了";
        }
        else
        {
            
            self.TopViewLabel.text = @"上拉加载图文详情";
        }
    }
    
    //下拉
    if (scrollView == self.BottomView)
    {
        if ( scrollView.contentOffset.y <= -100)
        {
            self.BottomViewLabel.text = @"可以松开了";
        }
        else
        {
            
            self.BottomViewLabel.text = @"下拉返回商品信息";
        }
    }
}
//滑动控制
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;

{
    //上拉
    if (scrollView == self.TopView)
    {
        if ( scrollView.contentOffset.y >= (self.TopView.contentSize.height-self.TopView.frame.size.height + 100))
        {
            [UIView animateWithDuration:0.3 animations:^{
                
                self.ScrollView.contentOffset = CGPointMake(0, self.BottomView.frame.origin.y);
                
            }];
        }
    }
    //下拉
    if (scrollView == self.BottomView)
    {
        if ( scrollView.contentOffset.y <= -100)
        {
            [UIView animateWithDuration:0.3 animations:^{
                self.ScrollView.contentOffset = CGPointMake(0, 0);
            }];
        }
    }
}

//懒加载
- (UIScrollView *)ScrollView
{
    if (!_ScrollView)
    {
        _ScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KScreen_Width, KScreen_Height-64)];
        self.ScrollView.contentSize = CGSizeMake(KScreen_Width, self.BottomView.frame.origin.y+self.BottomView.frame.size.height);
        _ScrollView.scrollEnabled = NO;
        
        [self.view addSubview:_ScrollView];
    }
    return _ScrollView;
}

- (UIScrollView *)TopView
{
    if (!_TopView)
    {
        _TopView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KScreen_Width, KScreen_Height - 64)];
        _TopView.contentSize = CGSizeMake(KScreen_Width, KScreen_Height-64+5);
        _TopView.backgroundColor = [UIColor blueColor];
        _TopView.delegate = self;
        self.TopViewLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _TopView.contentSize.height, KScreen_Width, 20)];
        self.TopViewLabel.text = @"上拉加载图文详情";
        self.TopViewLabel.textAlignment = NSTextAlignmentCenter;
        [_TopView addSubview:self.TopViewLabel];
    }
    return _TopView;
}

- (UIScrollView *)BottomView
{
    if (!_BottomView)
    {
        _BottomView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.TopView.frame.size.height, KScreen_Width, KScreen_Height-64)];
        _BottomView.contentSize = CGSizeMake(KScreen_Width, KScreen_Height-63);
        _BottomView.backgroundColor = [UIColor yellowColor];
        _BottomView.delegate = self;
        self.BottomViewLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, -20, KScreen_Width, 20)];
        self.BottomViewLabel.text = @"下拉返回商品信息";
        self.BottomViewLabel.textAlignment = NSTextAlignmentCenter;
        [_BottomView addSubview:self.BottomViewLabel];
    }
    return _BottomView;
}
@end
