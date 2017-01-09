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

@interface HYHomeController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong,nonatomic) UITableView *myTableView;

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
        [self.view addSubview:_myTableView];
    }
}


#pragma mark - UITableviewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 4;
    }
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            HYTypeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"onde"];
            if (nil == cell) {
                cell = [[HYTypeCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"onde"];
            }
            return cell;
        } else if (indexPath.row == 1){
            HYHomeCycleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"twoID"];
            if (nil == cell) {
                cell = [[HYHomeCycleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"twoID"];
            }
            return cell;
        }else if (indexPath.row == 2){
            HYHomeImageCell *cell = [HYHomeImageCell cellWithTableView:tableView NSIndexPath:indexPath];
            cell.backgroundColor = kClearColor;
            return cell;
        } else if (indexPath.row == 3){
            HYHomeTipCell *cell = [HYHomeTipCell cellWithTableView:tableView NSIndexPath:indexPath];
            return cell;
        }
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return KScreen_Width/5 * 2;
        }else if (indexPath.row == 1 || indexPath.row == 2){
            return 60;
        } else if (indexPath.row == 3){
            return 40;
        }
    }
    return 90;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

@end
