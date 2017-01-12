//
//  HYPartTimeJobController.m
//  96
//
//  Created by admin on 17/1/12.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYPartTimeJobController.h"
#import "HYSectionHeadView.h"
#import "HYCyclesCell.h"
#import "HYTableToCollectionCell.h"
#import "HYPartTimeJobCell.h"


@interface HYPartTimeJobController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong,nonatomic) UITableView *myTableView;
@property (strong,nonatomic) NSArray *typeArr;

@end

@implementation HYPartTimeJobController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"兼职";
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


#pragma mark - UitableViewdelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }
    return 20;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            HYCyclesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HYCyclesCellID"];
            if (nil == cell) {
                cell = [[HYCyclesCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HYCyclesCellIDID"];
            }
            cell.myBlock = ^(NSInteger index){
                
            };
            return cell;
        }
        HYTableToCollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HYTableToCollectionCellID"];
        if (nil == cell) {
            cell = [[HYTableToCollectionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HYTableToCollectionCellID"];
        }
        cell.myBlock = ^(NSInteger index){
            
        };
        return cell;
    }
    HYPartTimeJobCell *cell = [HYPartTimeJobCell cellWithTableView:tableView NSIndexPath:indexPath];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
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
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HYSectionHeadView *headView = [[HYSectionHeadView alloc]initWithFrame:CGRectMake(10, 0, KScreen_Width - 20, 50)];
    if (section == 1){
        headView.nameLabel.text = @"兼职岗位";
    }
    return headView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


@end
