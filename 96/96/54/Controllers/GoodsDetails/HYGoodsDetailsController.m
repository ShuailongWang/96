//
//  HYGoodsDetailsController.m
//  96
//
//  Created by admin on 17/1/20.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYGoodsDetailsController.h"
#import "HYJonsDetailsSixCell.h"
#import "HYTitleLabelCell.h"
#import "HYGoodsDetailsCell.h"

#import "HYFreshModel.h"


#define scale  (320.0 / KScreen_Width)
@interface HYGoodsDetailsController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong,nonatomic) UITableView *myTableView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *bottowView;

@end

@implementation HYGoodsDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"商品详情";
    [self setupUI];
}

-(void)setupUI{
    if (nil == _imageView) {
        
        _imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"aaaa"]];
        _imageView.frame = CGRectMake(0, 10, KScreen_Width, 3330 /scale);
    }
    if (nil == _myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width, KScreen_Height - 50) style:UITableViewStylePlain];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.bounces = NO;
        _myTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        //去掉cell的下划线
        _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_myTableView];
    }
    if (nil == _bottowView) {
        _bottowView = [[UIView alloc]initWithFrame:CGRectMake(0, _myTableView.bottom, KScreen_Width, 50)];
        [self.view addSubview:_bottowView];
        
        
    }
}

#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        //轮播图
        HYJonsDetailsSixCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HYJonsDetailsSixCellID"];
        if (nil == cell) {
            cell = [[HYJonsDetailsSixCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HYJonsDetailsSixCellID"];
        }
        //选中后没有颜色
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.iconArr = @[self.model.img];
        
        return cell;
    }else if(indexPath.row == 1){
        HYTitleLabelCell *cell = [HYTitleLabelCell cellWithTableView:tableView NSIndexPath:indexPath];
        //选中后没有颜色
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.titleLabel.text = self.model.name;
        cell.priceLabel.text = [NSString stringWithFormat:@"$%@",self.model.market_price];
        
        return cell;
    }else if (indexPath.row == 2){
        HYGoodsDetailsCell *cell = [HYGoodsDetailsCell cellWithTableView:tableView NSIndexPath:indexPath];
        //选中后没有颜色
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model = self.model;
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellID"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCellID"];
    }
    //选中后没有颜色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [cell.contentView addSubview:self.imageView];
    
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        return 200;
    }else if(indexPath.row == 1){
        return 67;
    }else if(indexPath.row == 2){
        return 165;
    }
    return 3330 / scale;
}

-(void)setModel:(HYFreshModel *)model{
    _model = model;
    
    [self.myTableView reloadData];
}


@end
