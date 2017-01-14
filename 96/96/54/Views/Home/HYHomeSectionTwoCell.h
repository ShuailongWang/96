//
//  HYHomeSectionTwoCell.h
//  96
//
//  Created by WSL on 17/1/10.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HYZhaoPinModel;
@interface HYHomeSectionTwoCell : UITableViewCell

@property (strong,nonatomic) HYZhaoPinModel *model;

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;

@end
