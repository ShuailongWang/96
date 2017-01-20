//
//  HYHomeNewController.m
//  96
//
//  Created by admin on 17/1/13.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYHomeNewController.h"
#import "HYHomeSectionThreeCell.h"
#import "HYWebViewController.h"

@interface HYHomeNewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong,nonatomic) UITableView *myTableView;

@end

@implementation HYHomeNewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"你可能想看";
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
    return self.array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HYHomeSectionThreeCell *cell = [HYHomeSectionThreeCell cellWithTableView:tableView NSIndexPath:indexPath];
    cell.dict = self.array[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *dict = self.array[indexPath.row];
    NSString *strUrl = [dict[@"url"] stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    HYWebViewController *webVC = [[HYWebViewController alloc]init];
    webVC.strUrl = strUrl;
    [self.navigationController pushViewController:webVC animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 85;
}

-(void)setArray:(NSArray *)array{
    _array = array;
    
    [self.myTableView reloadData];
}

@end
