//
//  HYJobsController.m
//  96
//
//  Created by WSL on 17/1/10.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYJobsController.h"
#import "HYSectionHeadView.h"
#import "HYJobsOSectonOneCell.h"
#import "HYJobsOSectonToCell.h"
#import "HYJobsTSectionThreeCell.h"
#import "HYJobsToSectonOneCell.h"
#import "HYJobsTypeController.h"
#import "HYJonsDetailsController.h"


@interface HYJobsController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong,nonatomic) UITableView *myTableView;
@property (strong,nonatomic) NSArray *typeArr;

@end

@implementation HYJobsController

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
        [self.view addSubview:_myTableView];
    }
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    } else if(section == 1) {
        return 1;
    }
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            HYJobsOSectonOneCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HYJobsOSectonOneCellID"];
            if (nil == cell) {
                cell = [[HYJobsOSectonOneCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HYJobsOSectonOneCellID"];
            }
            return cell;
        }
        HYJobsOSectonToCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HYJobsOSectonToCellID"];
        if (nil == cell) {
            cell = [[HYJobsOSectonToCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HYJobsOSectonToCellID"];
        }
        return cell;
    } else if(indexPath.section == 1){
        HYJobsToSectonOneCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HYJobsToSectonOneCellID"];
        if (nil == cell) {
            cell = [[HYJobsToSectonOneCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HYJobsToSectonOneCellID"];
        }
        cell.array = self.typeArr;
        cell.myBlock = ^(NSInteger index){
            HYJobsTypeController *jobsTypeVC = [[HYJobsTypeController alloc]init];
            jobsTypeVC.title = self.typeArr[index];
            [self.navigationController pushViewController:jobsTypeVC animated:YES];
        };
        return cell;
    }
    HYJobsTSectionThreeCell *cell = [HYJobsTSectionThreeCell cellWithTableView:tableView NSIndexPath:indexPath];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return HYTypeCellHeight;
        }
        return HYJobsOSectonToCellHeight;
    } else if(indexPath.section == 1){
        if (indexPath.row == 0) {
            return HYJobsToSectonOneCellHeight;
        }
        return 50;
    }
    return 95;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.01;
    }
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 1 || section == 0) {
        return 10;
    }
    return 0.01;
}
// 组的头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HYSectionHeadView *headView = [[HYSectionHeadView alloc]initWithFrame:CGRectMake(10, 0, KScreen_Width - 20, 50)];
    if (section == 1) {
        headView.nameLabel.text = @"你可能在找";
    }else if (section == 2){
        headView.nameLabel.text = @"猜你喜欢";
    }
    return headView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 2) {
        HYJonsDetailsController *jonsDeailsVC = [[HYJonsDetailsController alloc]init];
        [self.navigationController pushViewController:jonsDeailsVC animated:YES];
    }
}



-(NSArray *)typeArr{
    if (nil == _typeArr) {
        _typeArr = @[@"搓澡工", @"足疗师", @"按摩师", @"针灸推拿", @"软件工程师", @"销售户代表", @"教师/助教", @"程序员", @"商务", @"经理", @"文员", @"人事专员"
                   ];
    }
    return _typeArr;
}
@end
