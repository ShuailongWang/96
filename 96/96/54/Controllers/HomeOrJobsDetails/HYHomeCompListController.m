//
//  HYHomeCompListController.m
//  96
//
//  Created by WSL on 17/1/13.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYHomeCompListController.h"
#import "HYHomeSectionTwoCell.h"
#import "HYHouseDetailsController.h"

@interface HYHomeCompListController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong,nonatomic) UITableView *myTableView;

@end

@implementation HYHomeCompListController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"详情";
    [self setupUI];
}

-(void)setupUI{
    if (nil == _myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        
        [self.view addSubview:_myTableView];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.companyArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HYHomeSectionTwoCell *cell = [HYHomeSectionTwoCell cellWithTableView:tableView NSIndexPath:indexPath];
    cell.model = self.companyArr[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    HYHouseDetailsController *detailsVC = [[HYHouseDetailsController alloc]init];
    detailsVC.model = self.companyArr[indexPath.row];
    [self.navigationController pushViewController:detailsVC animated:YES];
}


-(void)setCompanyArr:(NSArray *)companyArr{
    _companyArr = companyArr;
    
    [self.myTableView reloadData];
}
@end
