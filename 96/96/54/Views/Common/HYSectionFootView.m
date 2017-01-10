//
//  HYSectionFootView.m
//  96
//
//  Created by WSL on 17/1/10.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYSectionFootView.h"

@interface HYSectionFootView()

@end

@implementation HYSectionFootView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        if (nil == _footButton) {
            self.backgroundColor = [UIColor whiteColor];
            _footButton = [[UIButton alloc]initWithFrame:self.bounds];
            _footButton.centerX = self.centerX;
            [_footButton addTarget:self action:@selector(clickMorButton) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview: _footButton];
        }
    }
    return self;
}

-(void)clickMorButton{
    if (self.myBlock) {
        self.myBlock();
    }
}

@end
