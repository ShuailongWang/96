//
//  HYJonsDetailsSixCell.m
//  96
//
//  Created by admin on 17/1/11.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYJonsDetailsSixCell.h"

@interface HYJonsDetailsSixCell()<UICollectionViewDataSource, UICollectionViewDelegate, SDPhotoBrowserDelegate>

@property (nonatomic, strong) UICollectionView *myCollectionView;
@property (strong, nonatomic) UILabel *numLabel;
@property (strong, nonatomic) NSArray *iconArr;

@end

static NSString *HYJonsDetailsSixCellID = @"HYJonsDetailsSixCellID";
@implementation HYJonsDetailsSixCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        if (nil == _myCollectionView) {
            UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
            flowLayout.minimumLineSpacing = 0;
            flowLayout.minimumInteritemSpacing = 0;
            flowLayout.itemSize = CGSizeMake(KScreen_Width, HYJonsDetailsSixCellHeight);
            flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
            _myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width, HYJonsDetailsSixCellHeight) collectionViewLayout:flowLayout];
            _myCollectionView.dataSource = self;
            _myCollectionView.delegate = self;
            _myCollectionView.showsVerticalScrollIndicator = NO;
            _myCollectionView.showsHorizontalScrollIndicator = NO;
            _myCollectionView.backgroundColor = [UIColor whiteColor];
            _myCollectionView.pagingEnabled = YES;
            [_myCollectionView registerClass:[HYJonsDetailsSixCollectionCell class] forCellWithReuseIdentifier:HYJonsDetailsSixCellID];
            [self.contentView addSubview:_myCollectionView];
        }
        if (nil == _numLabel) {
            _numLabel = [[UILabel alloc]init];
            _numLabel.backgroundColor = [UIColor blackColor];
            _numLabel.textColor = [UIColor whiteColor];
            _numLabel.textAlignment = NSTextAlignmentCenter;
            _numLabel.text = [NSString stringWithFormat:@"1/%zd",self.iconArr.count];
            [self.contentView addSubview:_numLabel];
        }
        [_numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.equalTo(self.contentView).offset(-20);
            make.height.equalTo(@30);
            make.width.equalTo(@50);
        }];
    }
    return self;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.iconArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HYJonsDetailsSixCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HYJonsDetailsSixCellID forIndexPath:indexPath];
    //加载图片
    NSURL *url = [NSURL URLWithString:self.iconArr[indexPath.item]];
    [cell.iconView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"404"]];
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //显示放大的图片
    SDPhotoBrowser *photoVc = [[SDPhotoBrowser alloc]init];
    photoVc.sourceImagesContainerView = self.myCollectionView;
    photoVc.imageCount = self.iconArr.count;
    photoVc.currentImageIndex = indexPath.item;
    photoVc.delegate = self;
    [photoVc show];
}
// 返回高质量图片的url
- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index{
    NSString *urlStr = self.iconArr[index];
    return [NSURL URLWithString:urlStr];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsectX = scrollView.contentOffset.x;
    
    int pageNum = offsectX/KScreen_Width;
    self.numLabel.text = [NSString stringWithFormat:@"%d/%zd", pageNum + 1, self.iconArr.count];
}

-(NSArray *)iconArr{
    if (nil == _iconArr) {
        _iconArr = @[
                     @"http://img2.niutuku.com/desk/1207/1049/ntk133175.jpg",
                     @"http://img2.niutuku.com/desk/1207/1057/ntk121901.jpg",
                     @"http://img2.niutuku.com/desk/1207/1002/ntk122412.jpg",
                     @"http://img2.niutuku.com/desk/130220/37/37-niutuku.com-927.jpg",
                     @"http://img2.niutuku.com/desk/1207/1037/ntk131964.jpg",
                     @"http://img2.niutuku.com/desk/1208/1921/ntk-1921-39435.jpg",
                     @"http://img2.niutuku.com/desk/1208/1440/ntk-1440-10966.jpg",
                     @"http://img2.niutuku.com/desk/1207/1011/ntk123346.jpg"
                     ];
    }
    return _iconArr;
}
@end







#pragma mark - HYJonsDetailsSixCollectionCell
@implementation HYJonsDetailsSixCollectionCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        if (nil == _iconView) {
            _iconView = [[UIImageView alloc]initWithFrame:self.bounds];
            [self.contentView addSubview:_iconView];
        }
    }
    return self;
}

@end
