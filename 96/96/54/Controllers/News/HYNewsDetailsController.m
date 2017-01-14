//
//  HYNewsDetailsController.m
//  96
//
//  Created by WSL on 17/1/8.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYNewsDetailsController.h"
#import "HYNewsGuanCell.h"
#import "HYWebController.h"

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
    return self.newsData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HYNewsGuanCell *cell = [HYNewsGuanCell cellWithTableView:tableView NSIndexPath:indexPath];
    //选中后没有颜色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.dict = self.newsData[indexPath.row];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //判断是否有图片,没有的话,删除80
    return 250;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *dict = self.newsData[indexPath.row];
    
    HYWebController *webVC = [[HYWebController alloc]init];
    webVC.strUrl = dict[@"url"];
    [self.navigationController pushViewController:webVC animated:YES];
}


-(NSMutableArray *)newsData{
    if (nil == _newsData) {
        _newsData = [NSMutableArray array];
        NSDictionary *dict = @{
                               @"uniquekey": @"6c4caa0c3ba6e05e2a272892af43c00e",
                               @"title": @"杨幂的发际线再也回不去了么？网友吐槽像半秃",
                               @"date": @"2017-01-05 11:03",
                               @"category": @"yule",
                               @"author_name": @"腾讯娱乐",
                               @"url": @"http://mini.eastday.com/mobile/170105110355287.html?qid=juheshuju",
                               @"thumbnail_pic_s": @"http://03.imgmini.eastday.com/mobile/20170105/20170105110355_806f4ed3fe71d04fa452783d6736a02b_1_mwpm_03200403.jpeg",
                               @"thumbnail_pic_s02": @"http://03.imgmini.eastday.com/mobile/20170105/20170105110355_806f4ed3fe71d04fa452783d6736a02b_2_mwpm_03200403.jpeg",
                               @"thumbnail_pic_s03": @"http://03.imgmini.eastday.com/mobile/20170105/20170105110355_806f4ed3fe71d04fa452783d6736a02b_3_mwpm_03200403.jpeg"
                               };
        [_newsData addObject:dict];
    }
    return _newsData;
}

@end
