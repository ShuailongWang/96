//
//  HYHeadImageCell.m
//  96
//
//  Created by admin on 17/1/13.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYHeadImageCell.h"

@interface HYHeadImageCell()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *myCollectionView;
@property (strong, nonatomic) UIImageView *iconUserView;
@property (strong, nonatomic) UIButton *bigBtn;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIButton *smallBtn;

@end

static NSString *HYHeadImageCollectionCellID = @"HYHeadImageCollectionCellID";

@implementation HYHeadImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    if (nil == _myCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.itemSize = CGSizeMake(KScreen_Width, HYHeadImageCellHeight);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width, HYHeadImageCellHeight) collectionViewLayout:flowLayout];
        _myCollectionView.delegate = self;
        _myCollectionView.dataSource = self;
        _myCollectionView.backgroundColor = [UIColor whiteColor];
        _myCollectionView.pagingEnabled = YES;
        _myCollectionView.bounces = NO;
        [_myCollectionView registerClass: [HYHeadImageCollectionCell class] forCellWithReuseIdentifier:HYHeadImageCollectionCellID];
        [self.contentView addSubview:_myCollectionView];
    }
    if (nil == _iconUserView) {
        _iconUserView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width, HYHeadImageCellHeight)];
        _iconUserView.image = [UIImage imageNamed:@"imagepub_back"];
        [self.contentView addSubview:_iconUserView];
    }
    if (nil == _bigBtn) {
        _bigBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
        _bigBtn.center = _iconUserView.center;
        _bigBtn.centerY = _iconUserView.centerY - 20;
        [_bigBtn setBackgroundImage:[UIImage imageNamed:@"imagepub_add_big"] forState:UIControlStateNormal];
        [_bigBtn addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_bigBtn];
    }
    if (nil == _titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, _bigBtn.bottom, KScreen_Width - 20, 30)];
        _titleLabel.text = @"拍个照呗";
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLabel];
    }
    if (nil == _smallBtn) {
        _smallBtn = [[UIButton alloc]initWithFrame:CGRectMake(KScreen_Width - 44, HYHeadImageCellHeight - 44, 44, 44)];
        [_smallBtn setBackgroundImage:[UIImage imageNamed:@"imagepub_add_small"] forState:UIControlStateNormal];
        [_smallBtn addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
        _smallBtn.hidden = YES;
        [self.contentView addSubview:_smallBtn];
    }
}
-(void)clickButton{
    if (self.myBlock) {
        self.myBlock();
    }

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.photoArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HYHeadImageCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HYHeadImageCollectionCellID forIndexPath:indexPath];
    
    cell.iconImageView.image = self.photoArr[indexPath.item];
    cell.iconImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HYHeadImageCollectionCell *cell = (HYHeadImageCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [ZLShowBigImage showBigImage:cell.iconImageView];
}


-(void)setPhotoArr:(NSArray *)photoArr{
    _photoArr = photoArr;
    if (photoArr.count > 0) {
        self.iconUserView.hidden = YES;
        self.titleLabel.hidden = YES;
        self.bigBtn.hidden = YES;
        self.smallBtn.hidden = NO;
    }
    [self.myCollectionView reloadData];
}

@end




@implementation HYHeadImageCollectionCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        if (nil == _iconImageView) {
            _iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width, HYHeadImageCellHeight)];
            [self.contentView addSubview:_iconImageView];
        }
    }
    return self;
}

@end
