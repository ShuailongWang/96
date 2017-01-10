//
//  HYJobsOSectonToCell.m
//  96
//
//  Created by WSL on 17/1/10.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYJobsOSectonToCell.h"
#import "HYJobsOSectonToOneCell.h"

@interface HYJobsOSectonToCell()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong,nonatomic) UICollectionView *myCollectionView;
@property (strong,nonatomic) NSArray *array;

@end

static NSString *HYJobsOSectonToOneCellID = @"HYJobsOSectonToOneCell";
@implementation HYJobsOSectonToCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        if (nil == _myCollectionView) {
            UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
            flowLayout.minimumLineSpacing = 1;
            flowLayout.minimumInteritemSpacing = 0;
            flowLayout.itemSize = CGSizeMake((KScreen_Width - 1)/2, HYJobsOSectonToCellHeight);
            
            _myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width, HYJobsOSectonToCellHeight) collectionViewLayout:flowLayout];
            _myCollectionView.delegate = self;
            _myCollectionView.dataSource = self;
            _myCollectionView.backgroundColor = kBagroundColor;
            [_myCollectionView registerNib:[UINib nibWithNibName:@"HYJobsOSectonToOneCell" bundle: nil] forCellWithReuseIdentifier:HYJobsOSectonToOneCellID];
            [self.contentView addSubview:_myCollectionView];
        }
    }
    return self;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.array.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HYJobsOSectonToOneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: HYJobsOSectonToOneCellID forIndexPath:indexPath];
    NSDictionary *dict = self.array[indexPath.row];
    
    cell.iconImageView.image = [UIImage imageNamed: dict[@"Icon"]];
    cell.titleLabel.text = dict[@"Title"];
    cell.subLabel.text = dict[@"SubTitle"];
    
    return cell;
}


-(NSArray *)array{
    if (nil == _array) {
        _array = @[
                   @{
                       @"Title" : @"高薪高福利",
                       @"SubTitle" : @"优选靠谱福利好",
                       @"Icon" : @"job_main_haojob_gaoxin"
                       },
                   @{
                       @"Title" : @"附近职位",
                       @"SubTitle" : @"钱多事少离家近",
                       @"Icon" : @"job_main_haojob_near"
                       }
                   ];
    }
    return _array;
}

@end
