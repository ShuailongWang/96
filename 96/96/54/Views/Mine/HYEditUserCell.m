//
//  HYEditUserCell.m
//  General
//
//  Created by admin on 17/1/5.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYEditUserCell.h"


#define LeadingMagrin 15    //左右间距
#define OtherMagrin -30     //
#define SubImageSize 90     //头像的宽高
@implementation HYEditUserCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        
        [self setupUI];
    };
    return self;
}

-(void)setupUI{
    //
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_titleLabel];
    }
    if (!_subText) {
        _subText = [[UITextField alloc] init];
        _subText.font = [UIFont systemFontOfSize:16];
        _subText.textAlignment = NSTextAlignmentRight;
        _subText.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self.contentView addSubview:_subText];
    }
    if (!_subImgView) {
        _subImgView = [[UIImageView alloc] init];
        _subImgView.layer.masksToBounds = YES;
        _subImgView.layer.cornerRadius = SubImageSize * 0.5;
        [self.contentView addSubview:_subImgView];
    }
    
    //约束
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self);
        make.leading.equalTo(self).offset(LeadingMagrin);
    }];
    [_subText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.trailing.equalTo(self).offset(OtherMagrin);
        make.width.equalTo(@(KScreen_Width / 3 * 2));//屏幕的2/3
    }];
    [_subImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_titleLabel);
        make.right.equalTo(self).offset(OtherMagrin);
        make.width.height.equalTo(@(SubImageSize));
    }];
}

@end
