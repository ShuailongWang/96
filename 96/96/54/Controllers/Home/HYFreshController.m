//
//  HYFreshController.m
//  96
//
//  Created by admin on 17/1/16.
//  Copyright © 2017年 王帅龙. All rights reserved.
//  生鲜

#import "HYFreshController.h"
#import "HYCyclesCell.h"
#import "HYTableToCollectionCell.h"
#import "HYFreshCell.h"
#import "HYFreshHeadCell.h"
#import "HYFreshTwoListController.h"

@interface HYFreshController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong,nonatomic) UITableView *myTableView;
@property (nonatomic, strong) NSArray *typeArr;
@property (nonatomic, strong) NSArray *headArr;

@end

@implementation HYFreshController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"生鲜";
    [self setupUI];
}

-(void)setupUI{
    if (nil == _myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.bounces = NO;
        _myTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        [self.view addSubview:_myTableView];
    }
}


#pragma mark - UitableViewdelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }
    return 5 + 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            HYCyclesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HYCyclesCellID"];
            if (nil == cell) {
                cell = [[HYCyclesCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HYCyclesCellIDID"];
            }
            //MARK: 点击图片
            cell.myBlock = ^(NSInteger index){
                
            };
            return cell;
        }
        //MARK: 水果海鲜
        HYTableToCollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HYTableToCollectionCellID"];
        if (nil == cell) {
            cell = [[HYTableToCollectionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HYTableToCollectionCellID"];
        }
        //赋值
        cell.typeArr = self.typeArr;
        
        //MARK: 点击item
        cell.myBlock = ^(NSInteger index, NSString *itemTitle){
            HYFreshTwoListController *freshTwoListVC = [[HYFreshTwoListController alloc]init];
            freshTwoListVC.title = itemTitle;
            [self.navigationController pushViewController:freshTwoListVC animated:YES];
        };
        return cell;
    }
    //MARK: 组头
    if (indexPath.row == 0) {
        HYFreshHeadCell *cell = [HYFreshHeadCell cellWithTableView:tableView NSIndexPath:indexPath];
        NSDictionary *dict = self.headArr[indexPath.section - 1];
        cell.titleStr = dict[@"Title"];
        cell.iconImage = [UIImage imageNamed: dict[@"Icon"]];
        return cell;
    }
    //MARK: 内容列表
    HYFreshCell *cell = [HYFreshCell cellWithTableView:tableView NSIndexPath:indexPath];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100;
    }
    if (indexPath.row == 0) {
        return 45;
    }
    return 140;
}


#pragma mark - 懒加载
-(NSArray *)typeArr{
    if (nil == _typeArr) {
        _typeArr = @[
                     @{@"Title":@"新鲜水果", @"Icon":@"fruit"},
                     @{@"Title":@"蔬菜蛋类", @"Icon":@"vegetables"},
                     @{@"Title":@"精品肉类", @"Icon":@"meat"},
                     @{@"Title":@"海鲜水产", @"Icon":@"seafood"},
                     @{@"Title":@"冰饮冻食", @"Icon":@"frozenFood"}
                     ];
    }
    return _typeArr;
}
-(NSArray *)headArr{
    if (nil == _headArr) {
        _headArr = @[
                     @{@"Title":@"水果", @"Icon":@"fruitSmal"},
                     @{@"Title":@"蔬菜", @"Icon":@"vegetableSmal"},
                     @{@"Title":@"肉", @"Icon":@"meatSmal"},
                     @{@"Title":@"海鲜", @"Icon":@"seaSmal"},
                     @{@"Title":@"冻食", @"Icon":@"frozenSmal"}
                     ];
    }
    return _headArr;
}

@end
