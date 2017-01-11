//
//  HYJobsDetailsPlaceCell.m
//  96
//
//  Created by admin on 17/1/11.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYJobsDetailsPlaceCell.h"

@implementation HYJobsDetailsPlaceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYJobsDetailsPlaceCell";
    
    HYJobsDetailsPlaceCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}

@end
