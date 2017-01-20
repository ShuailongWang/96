//
//  HYFreshTwoListController.m
//  96
//
//  Created by WSL on 17/1/16.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYFreshTwoListController.h"
#import "HYFreshCell.h"
#import "HYGoodsDetailsController.h"

@interface HYFreshTwoListController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong,nonatomic) UITableView *myTableView;

@end

@implementation HYFreshTwoListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

-(void)setupUI{
    if (nil == _myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.bounces = YES;
        _myTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        [self.view addSubview:_myTableView];
    }
}

#pragma mark - UitableViewdelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.freshData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    HYFreshCell *cell = [HYFreshCell cellWithTableView:tableView NSIndexPath:indexPath];
    cell.model = self.freshData[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 140;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    HYGoodsDetailsController *detailsVC = [[HYGoodsDetailsController alloc]init];
    detailsVC.model = self.freshData[indexPath.row];
    [self.navigationController pushViewController:detailsVC animated:YES];
}

-(void)setFreshData:(NSArray *)freshData{
    _freshData = freshData;
    
    [self.myTableView reloadData];
}

@end
