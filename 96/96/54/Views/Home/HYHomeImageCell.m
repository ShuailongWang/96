//
//  HYHomeImageCell.m
//  96
//
//  Created by WSL on 17/1/9.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYHomeImageCell.h"

@implementation HYHomeImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYHomeImageCell";
    
    HYHomeImageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}

@end
