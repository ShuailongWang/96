//
//  HYHomeSectionThreeCell.m
//  96
//
//  Created by WSL on 17/1/10.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYHomeSectionThreeCell.h"

@interface HYHomeSectionThreeCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;


@end

@implementation HYHomeSectionThreeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYHomeSectionThreeCell";
    
    HYHomeSectionThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}

-(void)setDict:(NSDictionary *)dict{
    _dict = dict;
    
    self.titleLabel.text = dict[@"title"];
    NSString *strUrl = [dict[@"firstImg"] stringByReplacingOccurrencesOfString:@" " withString:@""];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:strUrl] placeholderImage:[UIImage imageNamed:@"ad_123"]];
    self.numberLabel.text = dict[@"source"];
}

@end
