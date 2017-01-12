//
//  HYMineHeadCell.m
//  General
//
//  Created by admin on 17/1/5.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYMineHeadCell.h"

@interface HYMineHeadCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageview;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UILabel *subLabel;

@end

@implementation HYMineHeadCell

-(void)awakeFromNib{
    [super awakeFromNib];
    
    //变成圆角
    self.iconImageview.layer.cornerRadius = 50;
    self.iconImageview.layer.masksToBounds = YES;        //把多余的删除
}


- (IBAction)clickPenBtn:(UIButton *)sender {
    if (self.myBlock) {
        self.myBlock();
    }
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYMineHeadCell";
    
    HYMineHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}

@end
