//
//  HYPartTimeJobCell.m
//  96
//
//  Created by admin on 17/1/12.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYPartTimeJobCell.h"

@interface HYPartTimeJobCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *dayBtn;
@property (weak, nonatomic) IBOutlet UIButton *longOrShartBtn;


@end

@implementation HYPartTimeJobCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self addBorder:self.dayBtn];
    [self addBorder:self.longOrShartBtn];
    
    self.dayBtn.layer.borderColor = [RGB(55, 145, 251) CGColor];
    self.longOrShartBtn.layer.borderColor = [RGB(0, 247, 52) CGColor];
    
    
    self.timeLabel.attributedText = [@"30元/小时" AttributedWithRange:0 length:3 fontSize:15];
}
-(void)addBorder:(UIButton*)sender{
    sender.layer.borderWidth = 1;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYPartTimeJobCell";
    
    HYPartTimeJobCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}

@end
