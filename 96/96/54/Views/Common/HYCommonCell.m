//
//  HYCommonCell.m
//  96
//
//  Created by WSL on 17/1/12.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYCommonCell.h"

@implementation HYCommonCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYCommonCell";
    
    HYCommonCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}


@end
