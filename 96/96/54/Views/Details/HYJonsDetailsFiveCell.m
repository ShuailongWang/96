//
//  HYJonsDetailsFiveCell.m
//  96
//
//  Created by admin on 17/1/11.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYJonsDetailsFiveCell.h"

@interface HYJonsDetailsFiveCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *renZBtn;
@property (weak, nonatomic) IBOutlet UILabel *comapType;
@property (weak, nonatomic) IBOutlet UILabel *comapZL;


@end

@implementation HYJonsDetailsFiveCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.renZBtn.layer.borderColor = [RGB(40, 139, 251) CGColor];
    self.renZBtn.layer.borderWidth = 1;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYJonsDetailsFiveCell";
    
    HYJonsDetailsFiveCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}

@end
