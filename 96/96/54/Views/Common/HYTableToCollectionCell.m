//
//  HYTableToCollectionCell.m
//  96
//
//  Created by admin on 17/1/12.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYTableToCollectionCell.h"
#import "HYToCollectionCell.h"


@interface HYTableToCollectionCell()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *myCollectionView;
@property (nonatomic, strong) NSArray *array;

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
            flowLayout.itemSize = CGSizeMake( KScreen_Width/3, HYTableToCollectionCellHeight);
            
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
    return self.array.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HYToCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HYToCollectionCellID forIndexPath:indexPath];
    NSDictionary *dict = self.array[indexPath.item];
    cell.titleLabel.text = dict[@"Title"];
    cell.iconView.image = [UIImage imageNamed: dict[@"Icon"]];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.myBlock) {
        self.myBlock(indexPath.item);
    }
}

-(NSArray *)array{
    if (nil == _array) {
        _array = @[
                   @{@"Title":@"日结", @"Icon":@"pt_rijie_icon"},
                   @{@"Title":@"附近", @"Icon":@"pt_fujin_icon"},
                   @{@"Title":@"最新", @"Icon":@"pt_zuixin_icon"}
                   ];
    }
    return _array;
}

@end
