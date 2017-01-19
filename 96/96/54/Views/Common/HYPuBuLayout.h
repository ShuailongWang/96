//
//  HYPuBuLayout.h
//  96
//
//  Created by admin on 17/1/19.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYPuBuLayout : UICollectionViewLayout

//总共多少列，默认是2
@property (nonatomic, assign) NSInteger columnCount;

//列间距，默认是0
@property (nonatomic, assign) NSInteger columnSpacing;

//行间距，默认是0
@property (nonatomic, assign) NSInteger rowSpacing;

//section与collectionView的间距，默认是（0，0，0，0）
@property (nonatomic, assign) UIEdgeInsets sectionInset;

//计算item高度的block，将item的高度与indexPath传递给外界
@property (nonatomic, strong) CGFloat(^itemHeightBlock)(CGFloat itemHeight,NSIndexPath *indexPath);

//同时设置列间距，行间距，sectionInset
- (void)setColumnSpacing:(NSInteger)columnSpacing rowSpacing:(NSInteger)rowSepacing sectionInset:(UIEdgeInsets)sectionInset;

#pragma mark- 构造方法
+ (instancetype)ShopLayoutWithColumnCount:(NSInteger)columnCount;
- (instancetype)initWithColumnCount:(NSInteger)columnCount;

@end
