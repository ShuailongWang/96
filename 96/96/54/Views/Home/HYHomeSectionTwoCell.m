//
//  HYHomeSectionTwoCell.m
//  96
//
//  Created by WSL on 17/1/10.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYHomeSectionTwoCell.h"
#import "HYZhaoPinModel.h"

@interface HYHomeSectionTwoCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UILabel *educationLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyName;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@end

@implementation HYHomeSectionTwoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYHomeSectionTwoCell";
    
    HYHomeSectionTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}

-(void)setModel:(HYZhaoPinModel *)model{
    _model = model;
    
    
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.companyLogo] placeholderImage:[UIImage imageNamed:@""]];
    self.titleLabel.text = model.Name;
    self.numberLabel.text = model.Salary60;
    self.placeLabel.text = model.WorkCity;
    self.companyName.text = model.CompanyName;
    self.educationLabel.text = model.Education;
    self.timeLabel.text = model.PublishTime;
}

@end
