//
//  HYTableToCollectionCell.h
//  96
//
//  Created by admin on 17/1/12.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HYTableToCollectionCellHeight   100
@interface HYTableToCollectionCell : UITableViewCell

@property (nonatomic, strong) NSArray *typeArr;

@property (copy,nonatomic) void(^myBlock)(NSInteger index, NSString *itemTitle);

@end
