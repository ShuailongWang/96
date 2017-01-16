//
//  HYHomeController.m
//  96
//
//  Created by WSL on 17/1/8.
//  Copyright © 2017年 王帅龙. All rights reserved.
//  首页

#import "HYHomeController.h"
#import "HYTypeCell.h"
#import "HYHomeCycleCell.h"
#import "HYHomeImageCell.h"
#import "HYHomeTipCell.h"
#import "HYSectionHeadView.h"
#import "HYSectionFootView.h"
#import "HYHomeTypeThreeCell.h"
#import "HYHomeSectionTwoCell.h"
#import "HYHomeSectionThreeCell.h"
#import "HYHouseDetailsController.h"
#import "HYHomeNewController.h"
#import "HYJobsController.h"
#import "HYPartTimeJobController.h"
#import "HYZhaoPinModel.h"
#import "HYHomeCompListController.h"
#import "HYWebController.h"
#import "HYGoodsController.h"
#import "HYFreshController.h"

@interface HYHomeController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *myTableView;
@property (strong, nonatomic) NSArray *typeCellData;

@property (strong, nonatomic) NSArray *zpData;
@property (nonatomic, strong) NSArray *threeData;

@end

@implementation HYHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}

-(void)setupUI{
    if (nil == _myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.bounces = NO;
        _myTableView.showsHorizontalScrollIndicator = NO;
        _myTableView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_myTableView];
    }
}


#pragma mark - UITableviewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 5;
    }else if (section == 1 && self.zpData.count > 0){
        return [[self.zpData subarrayWithRange:NSMakeRange(0, 10)] count];
    }else if (section == 2 && self.threeData.count > 0) {
        return [[self.threeData subarrayWithRange:NSMakeRange(0, 10)] count];
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            HYTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HYTypeCellID"];
            if (nil == cell) {
                cell = [[HYTypeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HYTypeCellID"];
            }
            
            //MARK: 点击最上方的item
            cell.myBlock = ^(NSInteger index){
                switch (index) {
                    case 0:{
                        //MARK: 商品
                        HYGoodsController *goodsVC = [[HYGoodsController alloc]init];
                        [self.navigationController pushViewController:goodsVC animated:YES];
                    }
                        break;
                    case 1:{
                        //MARK: 全职招聘
                        HYFreshController *freshVC = [[HYFreshController alloc]init];
                        [self.navigationController pushViewController:freshVC animated:YES];
                    }
                        break;
                    case 3:{
                        //MARK: 全职招聘
                        HYJobsController *jobsVC = [[HYJobsController alloc]init];
                        [self.navigationController pushViewController:jobsVC animated:YES];
                    }
                        break;
                    case 4:{
                        //MARK: 兼职
                        HYPartTimeJobController *partTimeVC = [[HYPartTimeJobController alloc]init];
                        [self.navigationController pushViewController:partTimeVC animated:YES];
                    }
                        break;
                    default:
                        break;
                }
                
            };
            return cell;
        } else if (indexPath.row == 1){
            HYHomeCycleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HYHomeCycleCellID"];
            if (nil == cell) {
                cell = [[HYHomeCycleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HYHomeCycleCellID"];
            }
            return cell;
        }else if (indexPath.row == 2){
            HYHomeImageCell *cell = [HYHomeImageCell cellWithTableView:tableView NSIndexPath:indexPath];
            cell.backgroundColor = kClearColor;
            return cell;
        } else if (indexPath.row == 3){
            HYHomeTipCell *cell = [HYHomeTipCell cellWithTableView:tableView NSIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 4) {
            HYHomeTypeThreeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HYHomeTypeThreeCellID"];
            if (nil == cell) {
                cell = [[HYHomeTypeThreeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HYHomeTypeThreeCellID"];
            }
            return cell;
        }
    } else if (indexPath.section == 1){
        HYHomeSectionTwoCell *cell = [HYHomeSectionTwoCell cellWithTableView:tableView NSIndexPath:indexPath];
        cell.model = self.zpData[indexPath.row];
        return cell;
    }
    HYHomeSectionThreeCell *cell = [HYHomeSectionThreeCell cellWithTableView:tableView NSIndexPath:indexPath];
    cell.dict = self.threeData[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //MARK: 点击招聘
    if (indexPath.section == 1) {
        HYHouseDetailsController *detailsVC = [[HYHouseDetailsController alloc]init];
        detailsVC.model = self.zpData[indexPath.row];
        [self.navigationController pushViewController:detailsVC animated:YES];
        
    }else if(indexPath.section == 2){
        //MARK: 点击新闻
        NSDictionary *dict = self.threeData[indexPath.row];
        NSString *strUrl = [dict[@"url"] stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        HYWebController *webVC = [[HYWebController alloc]init];
        webVC.strUrl = strUrl;
        [self.navigationController pushViewController:webVC animated:YES];
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return HYTypeCellHeight;
        }else if (indexPath.row == 1 || indexPath.row == 2){
            return 80;
        } else if (indexPath.row == 3){
            return 60;
        } else if (indexPath.row == 4){
            return HYHomeTypeThreeCellHeight;
        }
    }else if(indexPath.section == 1){
        return 100;
    }
    return 90;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0 || (self.zpData.count > 0 && section == 1) || (self.threeData.count > 0 && section == 2)) {
        return 50;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 10;
    }
    if ((self.zpData.count > 0 && section == 1) || (self.threeData.count > 0 && section == 2)) {
        return 50;
    }
    return 0.01;
}
// 组的头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HYSectionHeadView *headView = [[HYSectionHeadView alloc]initWithFrame:CGRectMake(10, 0, KScreen_Width - 20, 50)];
    if (section == 0) {
        headView.nameLabel.text = @"足迹";
    }else if (section == 1){
        //判断是否有数据
        headView.nameLabel.text = @"猜你喜欢";
    }else if (section == 2){
        //判断是否有数据
        headView.nameLabel.text = @"您可能还想看";
    }
    if (section == 0 || (self.zpData.count > 0 && section == 1) || (self.threeData.count > 0 && section == 2)) {
        return headView;
    }
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return nil;
    }
    //判断是否有数据
    
    HYSectionFootView *footView = [[HYSectionFootView alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width, 50)];
    [footView.footButton setTitle:@"查看更多" forState:UIControlStateNormal];
    [footView.footButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    footView.myBlock = ^{
        if (section == 1) {
            HYHomeCompListController *compListVC = [[HYHomeCompListController alloc]init];
            compListVC.companyArr = self.zpData;
            [self.navigationController pushViewController:compListVC animated:YES];
        }else if(section == 2){
            HYHomeNewController *homeNewVC = [[HYHomeNewController alloc]init];
            homeNewVC.array = self.threeData;
            [self.navigationController pushViewController:homeNewVC animated:YES];
        }
    };
    if ((self.zpData.count > 0 && section == 1) || (self.threeData.count > 0 && section == 2)) {
        return footView;
    }
    return nil;
}


-(NSArray *)typeCellData{
    if (nil == _typeCellData) {
        NSString * dataPath = [[NSBundle mainBundle] pathForResource:@"HomeType.plist" ofType:nil];
        _typeCellData = [NSArray arrayWithContentsOfFile:dataPath];
    }
    return _typeCellData;
}

-(NSArray *)zpData{
    if (nil == _zpData) {
        _zpData = [HYZhaoPinModel ZhaoPinModelWithArray];
    }
    return _zpData;
}
-(NSArray *)threeData{
    if (nil == _threeData) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"news" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        _threeData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    }
    return _threeData;
}
@end
