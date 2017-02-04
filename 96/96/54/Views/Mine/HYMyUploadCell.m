//
//  HYMyUploadCell.m
//  96
//
//  Created by admin on 17/2/4.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYMyUploadCell.h"

@interface HYMyUploadCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;    //图片
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;           //标题
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;            //时间
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;           //状态
@property (weak, nonatomic) IBOutlet UILabel *skimNumLabel;         //浏览
@property (weak, nonatomic) IBOutlet UIButton *refreshButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *moreButton;
@property (weak, nonatomic) IBOutlet UIButton *resumeButton;


@end

@implementation HYMyUploadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setFrame:(CGRect)frame{
    //修改cell的Y值下移10;
    //修改cell的高度减少10;
    
    static CGFloat margin = 10;
    frame.origin.y += margin;
    frame.size.height -= margin;
    
    [super setFrame:frame];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYMyUploadCell";
    
    HYMyUploadCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}


//点击按钮
- (IBAction)clickMyUploadButton:(UIButton *)sender {
    if([self.delegate respondsToSelector:@selector(HYMyUploadCell:clickButton:)]){
        [self.delegate HYMyUploadCell:self clickButton:sender.tag];
    }
}


- (void)hide{
    self.resumeButton.hidden = NO;
    self.refreshButton.hidden = YES;
    self.shareButton.hidden = YES;
    self.moreButton.hidden = YES;
    self.stateLabel.text = @"个人删除";
    self.stateLabel.textColor = [UIColor redColor];
}
- (void)show{
    self.resumeButton.hidden = YES;
    self.refreshButton.hidden = NO;
    self.shareButton.hidden = NO;
    self.moreButton.hidden = NO;
    self.stateLabel.text = @"显示中";
    self.stateLabel.textColor = RGB(100, 249, 111);
}

@end
