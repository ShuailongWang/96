//
//  HYHomeImageCell.h
//  96
//
//  Created by WSL on 17/1/9.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYHomeImageCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;

@end
