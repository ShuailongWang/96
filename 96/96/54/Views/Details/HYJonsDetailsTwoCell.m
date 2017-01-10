//
//  HYJonsDetailsTwoCell.m
//  96
//
//  Created by WSL on 17/1/10.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYJonsDetailsTwoCell.h"

@interface HYJonsDetailsTwoCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *berfLabel;
@property (weak, nonatomic) IBOutlet UILabel *fuliOne;
@property (weak, nonatomic) IBOutlet UILabel *fuliTwo;



@end
@implementation HYJonsDetailsTwoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self addBord:self.fuliOne];
    [self addBord:self.fuliTwo];
}

-(void)addBord:(UILabel*)label{
    label.layer.borderColor = [[UIColor redColor] CGColor];
    label.layer.borderWidth = 1;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"HYJonsDetailsTwoCell";
    
    HYJonsDetailsTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    }
    return cell;
}


@end
