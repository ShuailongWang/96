//
//  HYNewsDetailsController.m
//  96
//
//  Created by WSL on 17/1/8.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYNewsDetailsController.h"
#import "HYNewsGuanCell.h"

@interface HYNewsDetailsController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong,nonatomic) UITableView *myTableView;
@property (strong,nonatomic) NSMutableArray *newsData;

@end

@implementation HYNewsDetailsController

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
        _myTableView.bounces = NO;
        _myTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        _myTableView.backgroundColor = kClearColor;
        [self.view addSubview:_myTableView];
    }
}



#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HYNewsGuanCell *cell = [HYNewsGuanCell cellWithTableView:tableView NSIndexPath:indexPath];
    //选中后没有颜色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //判断是否有图片,没有的话,删除80
    return 250;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


-(NSMutableArray *)newsData{
    if (nil == _newsData) {
        _newsData = [NSMutableArray array];
    }
    return _newsData;
}

@end
