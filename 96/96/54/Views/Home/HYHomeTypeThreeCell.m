//
//  HYHomeTypeThreeCell.m
//  96
//
//  Created by admin on 17/1/10.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYHomeTypeThreeCell.h"
#import "HYTypeCollectionCell.h"

@interface HYHomeTypeThreeCell()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *myCollectionView;
@property (nonatomic, strong) NSArray *array;

@end

static NSString *HYHomeTypeThreeCellID = @"HYHomeTypeThreeCellID";

@implementation HYHomeTypeThreeCell

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
            flowLayout.itemSize = CGSizeMake(130, HYHomeTypeThreeCellHeight);
            flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            
            _myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width, HYHomeTypeThreeCellHeight) collectionViewLayout:flowLayout];
            _myCollectionView.delegate = self;
            _myCollectionView.dataSource = self;
            _myCollectionView.showsVerticalScrollIndicator = NO;
            _myCollectionView.showsHorizontalScrollIndicator = NO;
            _myCollectionView.backgroundColor = [UIColor whiteColor];
            [_myCollectionView registerNib:[UINib nibWithNibName:@"HYTypeCollectionCell" bundle: nil] forCellWithReuseIdentifier:HYHomeTypeThreeCellID];
            [self.contentView addSubview:_myCollectionView];
        }
    }
    return self;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.array.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
     HYTypeCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HYHomeTypeThreeCellID forIndexPath:indexPath];
    
    NSDictionary *dict = self.array[indexPath.row];
    cell.titleLabel.text = dict[@"Title"];
    cell.iconImageView.image = [UIImage imageNamed:dict[@"Icon"]];
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.myBlock) {
        self.myBlock();
    }
}


-(NSArray *)array{
    if (nil == _array) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"HomeTypeCol.plist" ofType:nil];
        _array = [NSArray arrayWithContentsOfFile:path];
    }
    return _array;
}

@end
