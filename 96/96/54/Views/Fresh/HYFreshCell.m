//
//  HYFreshCell.m
//  96
//
//  Created by admin on 17/1/16.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYFreshCell.h"

@implementation HYFreshCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYFreshCell";
    
    HYFreshCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}

@end
