//
//  HYJianliWSCell.m
//  96
//
//  Created by WSL on 17/1/9.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYJianliWSCell.h"

@interface HYJianliWSCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;


@end

@implementation HYJianliWSCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)clickWsButton:(UIButton *)sender {
    
    
}

@end
