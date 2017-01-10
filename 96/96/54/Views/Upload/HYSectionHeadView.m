//
//  HYSectionHeadView.m
//  96
//
//  Created by admin on 17/1/10.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYSectionHeadView.h"

@implementation HYSectionHeadView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        if (nil == _nameLabel) {
            self.backgroundColor = RGB(222, 238, 252);
            _nameLabel = [UILabel labelWithTitle:@"活动评估"];
            _nameLabel.frame = self.bounds;
            _nameLabel.x = 10;
            [self addSubview:_nameLabel];
        }
    }
    return self;
}

@end
