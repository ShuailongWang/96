//
//  HYGoodsTwoListController.m
//  96
//
//  Created by admin on 17/1/20.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYGoodsTwoListController.h"
#import "HYGoodsThreeCell.h"
#import "HYReusableHeadView.h"
#import "HYFreshModel.h"
#import "HYGoodsDetailsController.h"

@interface HYGoodsTwoListController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong,nonatomic) UICollectionView *myCollectionView;
@property (nonatomic, strong) NSArray *freshData;

@end

@implementation HYGoodsTwoListController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"商品列表";
    [self setupUI];
}

-(void)setupUI{
    if (nil == _myCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        flowLayout.itemSize = CGSizeMake((KScreen_Width - 30) / 2, 240);
        
        _myCollectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _myCollectionView.delegate = self;
        _myCollectionView.dataSource = self;
        _myCollectionView.bounces = NO;
        _myCollectionView.backgroundColor = kClearColor;
        [_myCollectionView registerNib:[UINib nibWithNibName:@"HYGoodsThreeCell" bundle:nil] forCellWithReuseIdentifier:@"HYGoodsThreeCellID"];
        
        [self.view addSubview:_myCollectionView];
    }
}

#pragma mark - UICollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.freshData.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //MARK: - 列表
    HYGoodsThreeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HYGoodsThreeCellID" forIndexPath:indexPath];
    
    cell.model = self.freshData[indexPath.row];
    
    return cell;
}
//MARK: - 点击Item
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HYGoodsDetailsController *detailsVC = [[HYGoodsDetailsController alloc]init];
    [self.navigationController pushViewController:detailsVC animated:YES];
}



//MARK: - 数据
-(NSArray *)freshData{
    if (nil == _freshData) {
        _freshData = [HYFreshModel FreshModelWithArray];
    }
    return _freshData;
}

@end
