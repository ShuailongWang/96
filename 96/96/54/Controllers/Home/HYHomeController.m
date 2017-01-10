//
//  HYHomeController.m
//  96
//
//  Created by WSL on 17/1/8.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

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
#import "HYJobsController.h"

@interface HYHomeController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong,nonatomic) UITableView *myTableView;
@property (strong,nonatomic) NSArray *typeCellData;

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
    }else if (section == 1){
        return 20;
    }
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            HYTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HYTypeCellID"];
            if (nil == cell) {
                cell = [[HYTypeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HYTypeCellID"];
            }
            cell.myBlock = ^(NSInteger index){
                NSLog(@"%zd",index);
                switch (index) {
                    case 3:{
                        HYJobsController *jobsVC = [[HYJobsController alloc]init];
                        [self.navigationController pushViewController:jobsVC animated:YES];
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
        return cell;
    }
    HYHomeSectionThreeCell *cell = [HYHomeSectionThreeCell cellWithTableView:tableView NSIndexPath:indexPath];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        HYHouseDetailsController *detailsVC = [[HYHouseDetailsController alloc]init];
        [self.navigationController pushViewController:detailsVC animated:YES];
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
    }
    return 85;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 10;
    }
    return 50;
}
// 组的头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HYSectionHeadView *headView = [[HYSectionHeadView alloc]initWithFrame:CGRectMake(10, 0, KScreen_Width - 20, 50)];
    if (section == 0) {
        headView.nameLabel.text = @"足迹";
    }else if (section == 1){
        headView.nameLabel.text = @"猜你喜欢";
    }else if (section == 2){
        headView.nameLabel.text = @"您可能还想看";
    }
    return headView;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return nil;
    }
    HYSectionFootView *footView = [[HYSectionFootView alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width, 50)];
    [footView.footButton setTitle:@"查看更多" forState:UIControlStateNormal];
    [footView.footButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    footView.myBlock = ^{
        
    };
    return footView;
}


-(NSArray *)typeCellData{
    if (nil == _typeCellData) {
        NSString * dataPath = [[NSBundle mainBundle] pathForResource:@"HomeType.plist" ofType:nil];
        _typeCellData = [NSArray arrayWithContentsOfFile:dataPath];
    }
    return _typeCellData;
}

@end
