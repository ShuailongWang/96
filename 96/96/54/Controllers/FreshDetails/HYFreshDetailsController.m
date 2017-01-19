//
//  HYFreshDetailsController.m
//  96
//
//  Created by WSL on 17/1/16.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYFreshDetailsController.h"

@interface HYFreshDetailsController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong,nonatomic) UITableView *myTableView;
@property (strong,nonatomic) NSArray *typeArr;

@end

@implementation HYFreshDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"详情";
    [self setupUI];
}

-(void)setupUI{
    if (nil == _myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.bounces = NO;
        _myTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableviewCell"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableviewCell"];
    }
    
    return cell;
}






@end
