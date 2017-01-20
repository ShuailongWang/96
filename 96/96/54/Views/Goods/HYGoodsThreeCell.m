//
//  HYGoodsThreeCell.m
//  96
//
//  Created by admin on 17/1/19.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYGoodsThreeCell.h"
#import "HYFreshModel.h"

@interface HYGoodsThreeCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImgaView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *specificsLabel;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;

@end

@implementation HYGoodsThreeCell

-(void)awakeFromNib{
    [super awakeFromNib];
    
}

-(void)setModel:(HYFreshModel *)model{
    _model = model;
    
    [self.iconImgaView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:[UIImage imageNamed:@"404"]];
    self.titleLabel.text = model.name;
    self.specificsLabel.text = model.specifics;
    self.numLabel.text = [NSString stringWithFormat:@"$%@",model.market_price];
}



@end
