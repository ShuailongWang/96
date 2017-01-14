//
//  HYHouseDetailsController.m
//  96
//
//  Created by WSL on 17/1/10.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYHouseDetailsController.h"
#import "HYSectionHeadView.h"
#import "HYJonsDetailsOneCell.h"
#import "HYJonsDetailsTwoCell.h"
#import "HYJobsDetailsPlaceCell.h"
#import "HYJonsDetailsFourCell.h"
#import "HYJonsDetailsFiveCell.h"
#import "HYJonsDetailsSixCell.h"

#import "HYZhaoPinModel.h"

@interface HYHouseDetailsController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong,nonatomic) UIView *footView;
@property (strong,nonatomic) UITableView *myTableView;
@property (assign,nonatomic) BOOL sectionCheck;

@end

@implementation HYHouseDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情";
    [self setupUI];
}

-(void)setModel:(HYZhaoPinModel *)model{
    _model = model;
    
    [self.myTableView reloadData];
}

-(void)setupUI{
    if (nil == _myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width, KScreen_Height - 60) style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.bounces = NO;
        
        [self.view addSubview:_myTableView];
    }
    if (nil == _footView) {
        _footView = [[UIView alloc]initWithFrame:CGRectMake(0, _myTableView.bottom, KScreen_Width, 60)];
        _footView.backgroundColor = RGB(35, 131, 246);
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width, 60)];
        [button setTitle:@"申请职位" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickSaveButton) forControlEvents:UIControlEventTouchUpInside];
        [_footView addSubview:button];
        [self.view addSubview:_footView];
    }
}
-(void)clickSaveButton{
    
    [SVProgressHUD show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
        
        [self.navigationController popViewControllerAnimated:YES];
    });
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else if(section == 3){
        if (self.sectionCheck) {
            return 3;
        }else{
            return 2;
        }
    }
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            HYJonsDetailsOneCell *cell = [HYJonsDetailsOneCell cellWithTableView:tableView NSIndexPath:indexPath];
            cell.titleLabel.text = self.model.Name;
            cell.numberLabel.text = self.model.Salary;
            return cell;
        }
        HYJonsDetailsTwoCell *cell = [HYJonsDetailsTwoCell cellWithTableView:tableView NSIndexPath:indexPath];
        
        cell.titleLabel.text = self.model.Name;
        cell.berfLabel.text = self.model.WorkingExp;
        
        if (self.model.WelfareTab.count > 0) {
            NSArray *arr = self.model.WelfareTab;
            cell.fuliOne.text = arr[0][@"0"];
            cell.fuliTwo.text = arr[0][@"1"];
        }
        
        return cell;
    }else if(indexPath.section == 1){
        HYJobsDetailsPlaceCell *cell = [HYJobsDetailsPlaceCell cellWithTableView:tableView NSIndexPath:indexPath];
        cell.titleLabel.text = self.model.WorkAddress;
        return cell;
    }else if(indexPath.section == 2){
        HYJonsDetailsFourCell *cell = [HYJonsDetailsFourCell cellWithTableView:tableView NSIndexPath:indexPath];
        cell.titleLabel.text = @"岗位职责:";
        cell.subLabel.text = @"1, 身高180以上 \n2, 形象好 \n3, 每月4周, 上班时间为上午08:00 下班时间为06:00";
        return cell;
    }else if (indexPath.section == 3){
        if (indexPath.row == 0) {
            HYJonsDetailsFiveCell *cell = [HYJonsDetailsFiveCell cellWithTableView:tableView NSIndexPath:indexPath];
            
            cell.titleLabel.text = self.model.CompanyName;
            cell.comapZL.text = self.model.JobType;
            
            return cell;
        }
        if (indexPath.row == 1 && self.sectionCheck) {
            HYJonsDetailsFourCell *cell = [HYJonsDetailsFourCell cellWithTableView:tableView NSIndexPath:indexPath];
            cell.titleLabel.text = @"公司地址: 苏州工业园娄葑文体中心";
            cell.subLabel.text = @"本店地处西三环紫竹桥，店内环境优雅，地理位置优越。是京城较早从事专业绿色保健按摩的养生服务机构，多年的经营得到了广大消费者的认可。\n一次舒适的减压体验，就是一次很好的心灵与身体的绽放之旅。在只属于自己的私密空间中，耳畔琴瑟萧萧，鼻尖香气袅绕，褪去了外衣的厚重，在花瓣包围的温泉水中融化僵硬的肌肉和心灵。——伊人高端男子减压会所竭诚欢迎有志之士加入，我们不仅为您提供丰厚的待遇，更为您提供一个广阔的工作平台，业内品牌影响力会让每一位员工都感到骄傲！";
            return cell;
        }
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellID"];
        if (nil == cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCellID"];
        }
        if (self.sectionCheck) {
            cell.textLabel.text = @"收起信息";
        }else {
            cell.textLabel.text = @"展开信息";
        }
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        return cell;
    }
    HYJonsDetailsSixCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HYJonsDetailsSixCellID"];
    if (nil == cell) {
        cell = [[HYJonsDetailsSixCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HYJonsDetailsSixCellID"];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 105;
    }else if (indexPath.section == 1){
        return 50;
    }else if (indexPath.section == 2){
        return 110;
    }else if(indexPath.section == 3){
        if (indexPath.row == 0) {
            return 180;
        }
        if (indexPath.row == 1 && self.sectionCheck) {
            return 230;
        }
        return 50;
    }
    return HYJonsDetailsSixCellHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.01;
    }
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
// 组的头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HYSectionHeadView *headView = [[HYSectionHeadView alloc]initWithFrame:CGRectMake(10, 0, KScreen_Width - 20, 50)];
    if (section == 0) {
        return nil;
    }else if (section == 1){
        headView.nameLabel.text = @"工作地址";
    }else if (section == 2){
        headView.nameLabel.text = @"职位描述";
    }else if (section == 3){
        headView.nameLabel.text = @"公司信息";
    }else if (section == 4){
        headView.nameLabel.text = @"公司图片";
    }
    return headView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger index;
    if (self.sectionCheck) {
        index = 2;
    }else{
        index = 1;
    }
    if (indexPath.section == 3 && indexPath.row == index) {
        self.sectionCheck = !self.sectionCheck;
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:indexPath.section];
        [tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationNone];
    }
}

@end
