//
//  HYJobsTypeCell.m
//  96
//
//  Created by WSL on 17/1/11.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYJobsTypeCell.h"

@interface HYJobsTypeCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *zhidingLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIButton *btnOne;
@property (weak, nonatomic) IBOutlet UIButton *btnTwo;
@property (weak, nonatomic) IBOutlet UIButton *btnThree;
@property (weak, nonatomic) IBOutlet UIButton *applyButton;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;


@end

@implementation HYJobsTypeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self addLine:self.btnTwo];
    [self addLine:self.btnThree];
}
-(void)addLine:(UIButton*)btn{
    btn.layer.borderColor = [RGB(79, 185, 248) CGColor];
    btn.layer.borderWidth = 1;
}

- (void)setFrame:(CGRect)frame{
    frame.size.height -= 10;
    [super setFrame:frame];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYJobsTypeCell";
    
    HYJobsTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}


- (IBAction)clickAppButton:(UIButton *)sender {

}

@end
