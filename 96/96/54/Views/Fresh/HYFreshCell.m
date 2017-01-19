//
//  HYFreshCell.m
//  96
//
//  Created by admin on 17/1/16.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYFreshCell.h"
#import "HYFreshModel.h"

@interface HYFreshCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;


@end
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

//点击购物车
- (IBAction)addGouwuche {
    
}

-(void)setModel:(HYFreshModel *)model{
    _model = model;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"404"]];
    self.titleLabel.text = model.name;
    self.subLabel.text = model.brand_name;
    self.numberLabel.text = model.market_price;
}

@end
