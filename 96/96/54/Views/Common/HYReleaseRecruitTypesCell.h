//
//  HYReleaseRecruitTypesCell.h
//  General
//
//  Created by admin on 17/1/6.
//  Copyright © 2017年 王帅龙. All rights reserved.
//  多个标签,福利

#import <UIKit/UIKit.h>

@class HYReleaseRecruitTypesCollectionCell;
@interface HYReleaseRecruitTypesCell : UITableViewCell

@property (nonatomic, strong) UILabel *typeLabel;
@property (nonatomic, strong) NSArray *typeData;

@property (copy,nonatomic) void(^myBlock)(BOOL isTrue, NSInteger index);

+(CGFloat)cellHeight;

@end






@interface HYReleaseRecruitTypesCollectionCell : UICollectionViewCell

@property (nonatomic, strong) UIButton *checkBtn;

@property (copy,nonatomic) void(^myBlock)(BOOL isTrue);

@end
