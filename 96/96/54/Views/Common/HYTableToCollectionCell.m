//
//  HYTableToCollectionCell.m
//  96
//
//  Created by admin on 17/1/12.
//  Copyright © 2017年 王帅龙. All rights reserved.
//  轮播图 - UITableViewCell

#import "HYTableToCollectionCell.h"
#import "HYToCollectionCell.h"


@interface HYTableToCollectionCell()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *myCollectionView;

@end

static NSString *HYToCollectionCellID = @"HYToCollectionCellID";
@implementation HYTableToCollectionCell

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
            
            _myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width, HYTableToCollectionCellHeight) collectionViewLayout:flowLayout];
            _myCollectionView.delegate = self;
            _myCollectionView.dataSource = self;
            _myCollectionView.backgroundColor = [UIColor whiteColor];
            [_myCollectionView registerNib: [UINib nibWithNibName:@"HYToCollectionCell" bundle:nil] forCellWithReuseIdentifier:HYToCollectionCellID];
            [self.contentView addSubview:_myCollectionView];
        }
    }
    return self;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.typeArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HYToCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HYToCollectionCellID forIndexPath:indexPath];
    NSDictionary *dict = self.typeArr[indexPath.item];
    cell.titleLabel.text = dict[@"Title"];
    cell.iconView.image = [UIImage imageNamed: dict[@"Icon"]];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //
    NSDictionary *dict = self.typeArr[indexPath.item];
    
    if (self.myBlock) {
        self.myBlock(indexPath.item, dict[@"Title"]);
    }
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake( KScreen_Width/self.typeArr.count, HYTableToCollectionCellHeight);
}

-(void)setTypeArr:(NSArray *)typeArr{
    _typeArr = typeArr;
    
    [self.myCollectionView reloadData];
}


@end
