//
//  HYFreshHeadCell.h
//  96
//
//  Created by admin on 17/1/16.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYFreshHeadCell : UITableViewCell

@property (nonatomic, strong) UIImage *iconImage;
@property (nonatomic, copy) NSString *titleStr;
+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;

@end
