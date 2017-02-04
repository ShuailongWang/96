//
//  HYUploadController.m
//  96
//
//  Created by WSL on 17/1/8.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYUploadController.h"
#import "HYMyUploadController.h"
#import "HYUploadMainCell.h"
#import "HYErShouController.h"
#import "HYHouseController.h"
#import "HYJobController.h"
#import "HYJianliController.h"

@interface HYUploadController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong,nonatomic) UICollectionView *myCollectionView;
@property (strong,nonatomic) NSArray *array;

@end

static NSString *HYUploadControllerCellID = @"HYUploadControllerCellID";

@implementation HYUploadController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"选择发布类别";
    self.title = @"发布";
    [self setupUI];
}

//设置UI
-(void)setupUI{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"我的..." style:UIBarButtonItemStylePlain target:self action:@selector(clickRightButton)];
    if (nil == _myCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.itemSize = CGSizeMake(KScreen_Width/3, KScreen_Width/3);
        _myCollectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _myCollectionView.delegate = self;
        _myCollectionView.dataSource = self;
        
        _myCollectionView.backgroundColor = [UIColor whiteColor];
        [_myCollectionView registerNib:[UINib nibWithNibName:@"HYUploadMainCell" bundle: nil] forCellWithReuseIdentifier:HYUploadControllerCellID];
        [self.view addSubview:_myCollectionView];
    }
}
//点击我的发布
-(void)clickRightButton{
    HYMyUploadController *myUploadVC = [[HYMyUploadController alloc]init];
    [self.navigationController pushViewController:myUploadVC animated:YES];
}

#pragma mark - UICollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.array.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HYUploadMainCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HYUploadControllerCellID forIndexPath:indexPath];
    
    NSDictionary *dict = self.array[indexPath.row];
    cell.iconView.image = [UIImage imageNamed:dict[@"Icon"]];
    cell.titleLabel.text = dict[@"Title"];
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.item == 0) {
        HYErShouController *erShouVC = [[HYErShouController alloc]init];
        [self.navigationController pushViewController:erShouVC animated:YES];
    }else if (indexPath.row == 1) {
        HYHouseController *houseVC = [[HYHouseController alloc]init];
        [self.navigationController pushViewController:houseVC animated:YES];
    }else if (indexPath.item == 4) {
        HYJobController *jobVC = [[HYJobController alloc]init];
        [self.navigationController pushViewController:jobVC animated:YES];
    } else if (indexPath.item == 5) {
        HYJianliController *jianliVC = [[HYJianliController alloc]init];
        [self.navigationController pushViewController:jianliVC animated:YES];
    }
}


#pragma mark - 懒加载
-(NSArray *)array{
    if (nil == _array) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"UploadMain.plist" ofType:nil];
        _array = [NSArray arrayWithContentsOfFile:path];
    }
    return _array;
}
@end
