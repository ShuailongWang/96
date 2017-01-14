//
//  HYJonsDetailsTwoCell.h
//  96
//
//  Created by WSL on 17/1/10.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYJonsDetailsTwoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *berfLabel;
@property (weak, nonatomic) IBOutlet UILabel *fuliOne;
@property (weak, nonatomic) IBOutlet UILabel *fuliTwo;

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;

@end
