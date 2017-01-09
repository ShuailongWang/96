//
//  HYJianliCell.m
//  96
//
//  Created by WSL on 17/1/9.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYJianliCell.h"

@interface HYJianliCell()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *bgView;

@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

@property (strong,nonatomic) UIButton *oldBtn;

@end

@implementation HYJianliCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.bgView.layer.borderWidth = 1;
    self.bgView.layer.borderColor = [RGB(218, 218, 218) CGColor];
    
    self.tipLabel.hidden = YES;
    self.subText.delegate = self;
    
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYJianliCell";
    HYJianliCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    self.tipLabel.hidden = NO;
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    self.tipLabel.hidden = YES;
}

- (IBAction)clickButton:(UIButton *)sender {
    if (self.oldBtn) {
        self.oldBtn.selected = !self.oldBtn.selected;
    }
    
    sender.selected = !sender.selected;
    self.oldBtn = sender;

}

@end
