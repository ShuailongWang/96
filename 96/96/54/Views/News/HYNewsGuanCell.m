//
//  HYNewsGuanCell.m
//  96
//
//  Created by admin on 17/1/13.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYNewsGuanCell.h"

@interface HYNewsGuanCell()

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconHeight;

@end

@implementation HYNewsGuanCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setFrame:(CGRect)frame{
    //修改cell的左右边距为10;
    //修改cell的Y值下移10;
    //修改cell的高度减少10;
    
    static CGFloat margin = 10;
    frame.origin.x = margin;
    frame.size.width -= 2 * frame.origin.x;
    frame.origin.y += margin;
    frame.size.height -= margin;
    
    [super setFrame:frame];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYNewsGuanCell";
    
    HYNewsGuanCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    cell.backgroundColor = kClearColor;
    return cell;
}

@end
