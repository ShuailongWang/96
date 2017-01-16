//
//  HYHeadImageCell.h
//  96
//
//  Created by admin on 17/1/13.
//  Copyright © 2017年 王帅龙. All rights reserved.
//  头部,拍照

#import <UIKit/UIKit.h>

#define HYHeadImageCellHeight   200

@interface HYHeadImageCell : UITableViewCell

@property (nonatomic, strong) NSArray *photoArr;

@property (copy,nonatomic) void(^myBlock)();

@end








@interface HYHeadImageCollectionCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *iconImageView;

@end
