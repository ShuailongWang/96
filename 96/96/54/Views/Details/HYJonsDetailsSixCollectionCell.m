//
//  HYJonsDetailsSixCollectionCell.m
//  96
//
//  Created by WSL on 17/1/11.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYJonsDetailsSixCollectionCell.h"

@implementation HYJonsDetailsSixCollectionCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        if (nil == _iconView) {
            _iconView = [[UIImageView alloc]initWithFrame:self.bounds];
            [self.contentView addSubview:_iconView];
        }
    }
    return self;
}

@end
