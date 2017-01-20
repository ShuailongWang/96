//
//  HYReusableHeadView.m
//  96
//
//  Created by admin on 17/1/19.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYReusableHeadView.h"


@interface HYReusableHeadView()

@property (nonatomic, strong) UILabel *headLabel;

@end

@implementation HYReusableHeadView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        if (nil == _headLabel) {
            _headLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, KScreen_Width-20, 30)];
            _headLabel.text = @"猜你喜欢";
            [self addSubview:_headLabel];
        }
    }
    return self;
}

-(void)setHeadName:(NSString *)headName{
    _headName = headName;
    
    self.headLabel.text = headName;
}



@end



#pragma mark - HYReusableFooterView
@interface HYReusableFooterView()

@property (nonatomic, strong) UILabel *footLabel;

@end

@implementation HYReusableFooterView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        if (nil == _footLabel) {
            _footLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, KScreen_Width-20, 35)];
            _footLabel.text = @"点击查看更多商品 >";
            _footLabel.textAlignment = NSTextAlignmentCenter;
            _footLabel.userInteractionEnabled = YES;
            _footLabel.backgroundColor = [UIColor whiteColor];
            [self addSubview:_footLabel];
            
            
            // 1. 实例化一个手势对象
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
            [_footLabel addGestureRecognizer:tap];
        }
    }
    return self;
}

#pragma mark - 点击个多
-(void)tap:(UITapGestureRecognizer*)tap{
    if (self.myBlock) {
        self.myBlock();
    }
}

-(void)setFootName:(NSString *)footName{
    _footName = footName;
    
    self.footLabel.text = footName;
}

-(void)hideLabel{
    self.footLabel.hidden = YES;
}
-(void)showLabel{
    self.footLabel.hidden = NO;
}



@end
