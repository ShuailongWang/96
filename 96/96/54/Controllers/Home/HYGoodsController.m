//
//  HYGoodsController.m
//  96
//
//  Created by admin on 17/1/16.
//  Copyright © 2017年 王帅龙. All rights reserved.
//  商品

#import "HYGoodsController.h"
#import "HYCollectionCyclesCell.h"
#import "HYCollectionOneImageCell.h"
#import "HYGoodsThreeCell.h"
#import "HYReusableHeadView.h"
#import "HYFreshModel.h"

@interface HYGoodsController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (strong,nonatomic) UICollectionView *myCollectionView;
@property (nonatomic, strong) NSArray *freshData;

@end

@implementation HYGoodsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"商品";
    [self setupUI];
}

-(void)setupUI{
    if (nil == _myCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 10;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        
        _myCollectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _myCollectionView.delegate = self;
        _myCollectionView.dataSource = self;
        _myCollectionView.bounces = NO;
        _myCollectionView.backgroundColor = kClearColor;
        [_myCollectionView registerClass:[HYCollectionCyclesCell class] forCellWithReuseIdentifier:@"HYCollectionCyclesCellID"];
        [_myCollectionView registerClass:[HYCollectionOneImageCell class] forCellWithReuseIdentifier:@"HYCollectionOneImageCellID"];
        [_myCollectionView registerNib:[UINib nibWithNibName:@"HYGoodsThreeCell" bundle:nil] forCellWithReuseIdentifier:@"HYGoodsThreeCellID"];
        //头
        [_myCollectionView registerClass:[HYReusableHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HYReusableHeadViewID"];
        
        [self.view addSubview:_myCollectionView];
    }
}

#pragma mark - UICollectionViewDelegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 4;
    }
    return 10;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        //MARK: 轮播
        if (indexPath.row == 0) {
            HYCollectionCyclesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HYCollectionCyclesCellID" forIndexPath:indexPath];
            if (nil == cell) {
                
            }
            return cell;
        }
        //MARK: 图片
        HYCollectionOneImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HYCollectionOneImageCellID" forIndexPath:indexPath];

        if (indexPath.row == 1) {
            [cell.iconView sd_setImageWithURL: [NSURL URLWithString:@"http://g.hiphotos.baidu.com/zhidao/pic/item/42166d224f4a20a4d06eaa0a91529822730ed08f.jpg"] placeholderImage:[UIImage imageNamed:@"404"]];
        }else if (indexPath.row == 2) {
            [cell.iconView sd_setImageWithURL: [NSURL URLWithString:@"http://pic27.nipic.com/20130316/12105533_131103716158_2.png"] placeholderImage:[UIImage imageNamed:@"404"]];
        }else if (indexPath.row == 3) {
            [cell.iconView sd_setImageWithURL: [NSURL URLWithString:@"http://e.hiphotos.baidu.com/zhidao/pic/item/b7fd5266d0160924bf75541bd30735fae6cd3459.jpg"] placeholderImage:[UIImage imageNamed:@"404"]];
        }
        return cell;
    }

    HYGoodsThreeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HYGoodsThreeCellID" forIndexPath:indexPath];
    
    cell.model = self.freshData[indexPath.row];
    
    return cell;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    //tou
    if (indexPath.section == 1 && kind == UICollectionElementKindSectionHeader) {
        HYReusableHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HYReusableHeadViewID" forIndexPath:indexPath];
        return headView;
    }
    return nil;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CGSizeMake(KScreen_Width, 120);
    }
    return CGSizeMake((KScreen_Width - 30) / 2, 240);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return CGSizeMake(KScreen_Width, 40);
    }
    return CGSizeZero;
}




-(NSArray *)freshData{
    if (nil == _freshData) {
        _freshData = [HYFreshModel FreshModelWithArray];
    }
    return _freshData;
}


@end
