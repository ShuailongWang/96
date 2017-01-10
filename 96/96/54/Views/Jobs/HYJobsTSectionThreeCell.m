//
//  HYJobsTSectionThreeCell.m
//  96
//
//  Created by WSL on 17/1/10.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYJobsTSectionThreeCell.h"

@interface HYJobsTSectionThreeCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;


@end

@implementation HYJobsTSectionThreeCell

-(void)awakeFromNib{
    [super awakeFromNib];
    
    self.tipLabel.layer.borderColor = [[UIColor redColor] CGColor];
    self.tipLabel.layer.borderWidth = 1;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYJobsTSectionThreeCell";
    
    HYJobsTSectionThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}


@end
