//
//  HYGoodsDetailsCell.m
//  96
//
//  Created by admin on 17/1/20.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYGoodsDetailsCell.h"
#import "HYFreshModel.h"

@interface HYGoodsDetailsCell()

//specifics
@property (weak, nonatomic) IBOutlet UILabel *specificsLabel;       //促销
@property (weak, nonatomic) IBOutlet UILabel *brandNameLabel;       //品牌
@property (weak, nonatomic) IBOutlet UILabel *specificationLabel;   //规格
@property (weak, nonatomic) IBOutlet UILabel *cuXBtn;


@end

@implementation HYGoodsDetailsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    //变成圆角
    self.cuXBtn.layer.cornerRadius = 5;
    self.cuXBtn.layer.masksToBounds = YES;        //把多余的删除
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYGoodsDetailsCell";
    
    HYGoodsDetailsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}

-(void)setModel:(HYFreshModel *)model{
    _model = model;
    
    self.specificsLabel.text = model.pm_desc;
    self.brandNameLabel.text = model.brand_name;
    self.specificationLabel.text = model.specifics;
}

@end
