//
//  HYHomeCycleCell.m
//  96
//
//  Created by WSL on 17/1/9.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYHomeCycleCell.h"

@interface HYHomeCycleCell()<SDCycleScrollViewDelegate>

@property (strong,nonatomic) UIImageView *iconView;
@property (strong,nonatomic) SDCycleScrollView *cycleScrollView;

@end

@implementation HYHomeCycleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if( self = [super initWithStyle:style reuseIdentifier:reuseIdentifier] ){
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    if (nil == _iconView) {
        _iconView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
        _iconView.image = [UIImage imageNamed:@"car_maincate"];
        [self.contentView addSubview:_iconView];
    }
    //
    NSArray *titles = @[@"新列车运行图今实施 全国最长高铁列车首发",
                        @"台媒称俄售华苏35战机焊死发动机 防技术被仿制",
                        @"纪检官员索贿300万：听到风声退还 过后又要回来",
                        @"虚拟世界里也可以社交？"
                        ];
    if (nil == _cycleScrollView) {
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(_iconView.right + 5, 0, KScreen_Width - _iconView.right - 15, 60) delegate:self placeholderImage:nil];
        _cycleScrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
        _cycleScrollView.onlyDisplayText = YES;
        _cycleScrollView.titleLabelTextColor = [UIColor blackColor];
        _cycleScrollView.titleLabelBackgroundColor = kClearColor;
        _cycleScrollView.titleLabelTextFont = [UIFont systemFontOfSize:17];
        _cycleScrollView.titlesGroup = titles;
        [self.contentView addSubview:_cycleScrollView];
    }
}

/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"%zd",index);
}

@end
