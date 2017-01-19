//
//  HYFreshCell.h
//  96
//
//  Created by admin on 17/1/16.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HYFreshModel;
@interface HYFreshCell : UITableViewCell

@property (nonatomic, strong) HYFreshModel *model;
+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;

@end
