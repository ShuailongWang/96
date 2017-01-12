//
//  HYUserHeadCell.m
//  96
//
//  Created by WSL on 17/1/12.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYUserHeadCell.h"

@interface HYUserHeadCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconUserView;
@property (weak, nonatomic) IBOutlet UIButton *bigBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *smallBtn;


@end

@implementation HYUserHeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self.smallBtn setHidden: YES];
}


+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYUserHeadCell";
    
    HYUserHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}


- (IBAction)clickButton {
    
    
}

@end
