//
//  HYPartTimeListController.m
//  96
//
//  Created by admin on 17/1/16.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYPartTimeListController.h"
#import "HYPartTimeJobCell.h"
#import "HYJonsDetailsController.h"

@interface HYPartTimeListController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *headView;
@property (nonatomic, strong) UITableView *myTableView;

@end

@implementation HYPartTimeListController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

//设置UI
-(void)setupUI{
    
    if (nil == _myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, KScreen_Width, KScreen_Height - 64) style:UITableViewStylePlain];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        [self.view addSubview:_myTableView];
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HYPartTimeJobCell *cell = [HYPartTimeJobCell cellWithTableView:tableView NSIndexPath:indexPath];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    HYJonsDetailsController *detailsVC = [[HYJonsDetailsController alloc]init];
    [self.navigationController pushViewController:detailsVC animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


-(UIView *)headView{
    if (nil == _headView) {
        _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width, 64)];
        
        [self.view addSubview:_headView];
    }
    return _headView;
}

@end

