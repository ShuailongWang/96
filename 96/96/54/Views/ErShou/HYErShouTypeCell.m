//
//  HYErShouTypeCell.m
//  96
//
//  Created by WSL on 17/1/12.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYErShouTypeCell.h"

@implementation HYErShouTypeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYErShouTypeCell";
    
    HYErShouTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}


- (IBAction)clickButton:(UIButton *)sender {
    sender.selected = !sender.selected;
}

@end
