//
//  HYNewsCell.m
//  96
//
//  Created by WSL on 17/1/8.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYNewsCell.h"

@interface HYNewsCell()

@property (weak, nonatomic) IBOutlet UIImageView *redImageView;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UILabel *subTitle;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@end

@implementation HYNewsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.loginBtn.layer.borderWidth = 1;
    self.loginBtn.layer.borderColor = [[UIColor redColor] CGColor];
    self.loginBtn.layer.cornerRadius = 3;
    self.loginBtn.layer.masksToBounds = YES;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYNewsCell";
    
    HYNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}


-(void)showRedImage{
    self.redImageView.hidden = NO;
}
-(void)hideRedImage{
    self.redImageView.hidden = YES;
}
-(void)showLoginBtn{
    self.loginBtn.hidden = NO;
}
-(void)hideloginBtn{
    self.loginBtn.hidden = YES;
}

@end
