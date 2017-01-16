//
//  HYReleaseRecruitTypesCell.m
//  General
//
//  Created by admin on 17/1/6.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYReleaseRecruitTypesCell.h"
#import "NSString+Common.h"
#import "UIView+Extension.h"

#define ItemHeight 20
#define ItemFont   15.0
#define ItemMagrin 10
@interface HYReleaseRecruitTypesCell()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *myCollectionView;

@end


static NSString *HYReleaseRecruitTypesCollectionCellID = @"HYReleaseRecruitTypesCollectionCellID";
CGFloat collectionHeight = 0;
@implementation HYReleaseRecruitTypesCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
-(void)setupUI{
    if (nil == _typeLabel) {
        _typeLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 50, 30)];
        _typeLabel.font = [UIFont systemFontOfSize:14];
        _typeLabel.textColor = [UIColor grayColor];
        _typeLabel.text = @"福利: ";
        [self.contentView addSubview:_typeLabel];
    }
    if (nil == _myCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 1;
        flowLayout.minimumInteritemSpacing = 2;
        
        _myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(_typeLabel.right, 0, KScreen_Width - 70, collectionHeight) collectionViewLayout: flowLayout];
        _myCollectionView.delegate = self;
        _myCollectionView.dataSource = self;
        _myCollectionView.backgroundColor = [UIColor whiteColor];
        [_myCollectionView registerClass:[HYReleaseRecruitTypesCollectionCell class] forCellWithReuseIdentifier:HYReleaseRecruitTypesCollectionCellID];
        [self.contentView addSubview:_myCollectionView];
    }
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.typeData.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HYReleaseRecruitTypesCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HYReleaseRecruitTypesCollectionCellID forIndexPath:indexPath];
    
    //设置标签
    [cell.checkBtn setTitle:self.typeData[indexPath.item] forState:UIControlStateNormal];
    
    cell.myBlock = ^(BOOL isTrue){
        [self backBlock:indexPath.row isTrue:isTrue];
    };
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *typeStr = self.typeData[indexPath.item];
    CGFloat itemWidth = [typeStr getWidthWithFont: ItemFont constrainedToSize:CGSizeMake(CGFLOAT_MAX, ItemHeight)] + ItemMagrin;
    
    return CGSizeMake(itemWidth, ItemHeight);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HYReleaseRecruitTypesCollectionCell *cell = (HYReleaseRecruitTypesCollectionCell*)[collectionView cellForItemAtIndexPath:indexPath];
    cell.checkBtn.selected = !cell.checkBtn.selected;
    [self backBlock:indexPath.row isTrue: cell.checkBtn.selected];
}

-(void)backBlock:(NSInteger)index isTrue:(BOOL)isTrue{
    if (self.myBlock) {
        self.myBlock(isTrue, index);
    }
}

//
+(CGFloat)cellHeight{
    return collectionHeight + 10;
}
-(void)setTypeData:(NSArray *)typeData{
    _typeData = typeData;
    
    CGFloat itemWidth = 0;
    for (int i = 0; i < self.typeData.count; i++) {
        NSString *typeStr = self.typeData[i];
        itemWidth += [typeStr getWidthWithFont: ItemFont constrainedToSize:CGSizeMake(CGFLOAT_MAX, ItemHeight)] + ItemMagrin;
    }
    CGFloat celWith = self.contentView.frame.size.width - 70;
    //几行
    int cols = itemWidth / celWith + 0.5;
    //行数*高度=总
    collectionHeight = cols * ItemHeight + 10;
    
    self.myCollectionView.frame = CGRectMake(_typeLabel.right, 5, KScreen_Width - 70, MAX(collectionHeight, 30));
    
    [self layoutIfNeeded];
}



@end





#pragma mark - HYReleaseRecruitTypesCollectionCell
@implementation HYReleaseRecruitTypesCollectionCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        if (nil == _checkBtn) {
            _checkBtn = [[UIButton alloc]initWithFrame:self.bounds];
            [_checkBtn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
            _checkBtn.titleLabel.font = [UIFont systemFontOfSize:ItemFont];
            [_checkBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            _checkBtn.layer.borderColor = [[UIColor redColor] CGColor];
            _checkBtn.layer.borderWidth = 1;
            [self.contentView addSubview:_checkBtn];
        }
    }
    return self;
}

-(void)clickButton:(UIButton*)sender{
    
    sender.selected = !sender.selected;
    
    
    
    if (self.myBlock) {
        self.myBlock(sender.selected);
    }
}


@end
