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

-(void)hideLabel{
    self.headLabel.hidden = YES;
}
-(void)showLabel{
    self.headLabel.hidden = NO;
}



@end
