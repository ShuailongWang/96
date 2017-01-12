//
//  HYMineHeadCell.h
//  General
//
//  Created by admin on 17/1/5.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYMineHeadCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;
@property (copy,nonatomic) void(^myBlock)();

@end
