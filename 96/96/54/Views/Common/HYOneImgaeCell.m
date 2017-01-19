//
//  HYOneImgaeCell.m
//  96
//
//  Created by admin on 17/1/19.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYOneImgaeCell.h"

@implementation HYOneImgaeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        if (nil == _iconView) {
            _iconView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width, 120)];
            [self.contentView addSubview:_iconView];
        }
    }
    return self;
}

@end
