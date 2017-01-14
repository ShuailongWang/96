//
//  HYNewsGuanCell.h
//  96
//
//  Created by admin on 17/1/13.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYNewsGuanCell : UITableViewCell

@property (strong,nonatomic) NSDictionary *dict;

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;

@end
