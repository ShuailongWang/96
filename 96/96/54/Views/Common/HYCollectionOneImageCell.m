//
//  HYCollectionOneImageCell.m
//  96
//
//  Created by admin on 17/1/19.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYCollectionOneImageCell.h"

@implementation HYCollectionOneImageCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        if (nil == _iconView) {
            _iconView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width-20, 120)];
            [self.contentView addSubview:_iconView];
        }
    }
    return self;
}



@end
