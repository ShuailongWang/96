//
//  HYTextFieldCell.m
//  96
//
//  Created by admin on 17/1/10.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYTextFieldCell.h"

@implementation HYTextFieldCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYTextFieldCell";
    HYTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    //选中后没有颜色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
