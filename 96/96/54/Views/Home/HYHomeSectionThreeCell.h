//
//  HYHomeSectionThreeCell.h
//  96
//
//  Created by WSL on 17/1/10.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYHomeSectionThreeCell : UITableViewCell

@property (nonatomic, strong) NSDictionary *dict;

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;

@end
