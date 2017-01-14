//
//  HYJonsDetailsFiveCell.h
//  96
//
//  Created by admin on 17/1/11.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYJonsDetailsFiveCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *renZBtn;
@property (weak, nonatomic) IBOutlet UILabel *comapType;
@property (weak, nonatomic) IBOutlet UILabel *comapZL;

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;

@end
