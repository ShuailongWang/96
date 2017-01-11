//
//  HYJobsDetailsPlaceCell.h
//  96
//
//  Created by admin on 17/1/11.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYJobsDetailsPlaceCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;

@end
