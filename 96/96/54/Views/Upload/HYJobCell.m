//
//  HYJobCell.m
//  96
//
//  Created by WSL on 17/1/9.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYJobCell.h"

@interface HYJobCell()

@property (weak, nonatomic) IBOutlet UIView *bgView;


@end

@implementation HYJobCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.bgView.layer.borderWidth = 1;
    self.bgView.layer.borderColor = [RGB(218, 218, 218) CGColor];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYJobCell";
    HYJobCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    //选中后没有颜色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


@end
