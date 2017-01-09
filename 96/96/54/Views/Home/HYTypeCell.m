//
//  HYTypeCell.m
//  96
//
//  Created by WSL on 17/1/9.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYTypeCell.h"
#import "HYTypeHeadCell.h"

@interface HYTypeCell()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong,nonatomic) UICollectionView *myCollectionView;
@property (strong,nonatomic) NSArray *typeArr;
@end

static NSString *HYTypeCellID = @"HYTypeCellID";
@implementation HYTypeCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        if (nil == _myCollectionView) {
            UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
            flowLayout.minimumLineSpacing = 0;
            flowLayout.minimumInteritemSpacing = 0;
            flowLayout.itemSize = CGSizeMake(KScreen_Width/5, KScreen_Width/5);
            flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            
            _myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width, KScreen_Width/5*2) collectionViewLayout:flowLayout];
            _myCollectionView.delegate = self;
            _myCollectionView.pagingEnabled = YES;
            _myCollectionView.dataSource = self;
            _myCollectionView.backgroundColor = self.backgroundColor;
            [_myCollectionView registerNib:[UINib nibWithNibName:@"HYTypeHeadCell" bundle: nil] forCellWithReuseIdentifier:HYTypeCellID];
            [self.contentView addSubview:_myCollectionView];
        }
    }
    return self;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HYTypeHeadCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HYTypeCellID forIndexPath:indexPath];
    
    NSDictionary *dict = self.typeArr[indexPath.row];
    cell.iconImageView.image = [UIImage imageNamed:dict[@"Icon"]];
    cell.titleLabel.text = dict[@"Title"];
    
    return cell;
}

-(NSArray *)typeArr{
    if (nil == _typeArr) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"UploadMain.plist" ofType:nil];
        _typeArr = [NSArray arrayWithContentsOfFile:path];
    }
    return _typeArr;
}


@end
