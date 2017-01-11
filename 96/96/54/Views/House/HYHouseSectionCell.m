//
//  HYHouseSectionCell.m
//  96
//
//  Created by WSL on 17/1/11.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYHouseSectionCell.h"

@interface HYHouseSectionCell()

@property (strong,nonatomic) UIButton *oldBtn;

@end
@implementation HYHouseSectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self addBorder:self.userBtn];
    [self addBorder:self.mediationBtn];
}
-(void)addBorder:(UIButton*)sender{
    sender.layer.borderColor = [[UIColor redColor] CGColor];
    sender.layer.borderWidth = 1;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYHouseSectionCell";
    HYHouseSectionCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    //选中后没有颜色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (IBAction)clickButton:(UIButton *)sender {
    if (self.oldBtn.selected) {
        self.oldBtn.selected = NO;
        self.oldBtn.backgroundColor = [UIColor whiteColor];
        [self.oldBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    sender.selected = !sender.selected;
    self.oldBtn = sender;
    sender.backgroundColor = [UIColor redColor];
    [self.oldBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

@end
