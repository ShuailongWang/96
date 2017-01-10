//
//  HYJobsToSectonOneCell.m
//  96
//
//  Created by WSL on 17/1/10.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYJobsToSectonOneCell.h"
#import "HYJobsToSectonOneToOneCell.h"

@interface HYJobsToSectonOneCell()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong,nonatomic) UICollectionView *myCollectionView;
@property (strong,nonatomic) NSArray *array;

@end

static NSString *HYJobsToSectonOneToOneCellID = @"HYJobsToSectonOneToOneCellID";

@implementation HYJobsToSectonOneCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        if (nil == _myCollectionView) {
            UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
            flowLayout.minimumLineSpacing = 1;
            flowLayout.minimumInteritemSpacing = 1;
            flowLayout.itemSize = CGSizeMake((KScreen_Width - 2)/3, (HYJobsToSectonOneCellHeight-3) / 4);
            
            _myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width, HYJobsToSectonOneCellHeight) collectionViewLayout:flowLayout];
            _myCollectionView.delegate = self;
            _myCollectionView.dataSource = self;
            _myCollectionView.backgroundColor = kBagroundColor;
            _myCollectionView.bounces = NO;
            _myCollectionView.showsVerticalScrollIndicator = NO;
            _myCollectionView.showsHorizontalScrollIndicator = NO;
            [_myCollectionView registerNib:[UINib nibWithNibName:@"HYJobsToSectonOneToOneCell" bundle: nil] forCellWithReuseIdentifier:HYJobsToSectonOneToOneCellID];
            [self.contentView addSubview:_myCollectionView];
        }
    }
    return self;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.array.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HYJobsToSectonOneToOneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: HYJobsToSectonOneToOneCellID forIndexPath:indexPath];
    
    cell.titleLabel.text = self.array[indexPath.row];
    
    return cell;
}


-(NSArray *)array{
    if (nil == _array) {
        _array = @[@"搓澡工", @"足疗师", @"按摩师", @"针灸推拿", @"软件工程师", @"销售户代表", @"教师/助教", @"程序员", @"商务", @"经理", @"文员", @"人事专员"
                   ];
    }
    return _array;
}


@end
