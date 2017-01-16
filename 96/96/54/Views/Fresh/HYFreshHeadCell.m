//
//  HYFreshHeadCell.m
//  96
//
//  Created by admin on 17/1/16.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYFreshHeadCell.h"

@interface HYFreshHeadCell()
@property (weak, nonatomic) IBOutlet UIButton *titleButton;

@end

@implementation HYFreshHeadCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYFreshHeadCell";
    
    HYFreshHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}

-(void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
    [self.titleButton setTitle:titleStr forState:UIControlStateNormal];
}
-(void)setIconImage:(UIImage *)iconImage{
    _iconImage = iconImage;
    [self.titleButton setImage:iconImage forState:UIControlStateNormal];
}

@end
