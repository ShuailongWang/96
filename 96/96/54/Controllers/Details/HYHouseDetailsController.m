//
//  HYHouseDetailsController.m
//  96
//
//  Created by WSL on 17/1/10.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYHouseDetailsController.h"

@interface HYHouseDetailsController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong,nonatomic) UITableView *myTableView;

@end

@implementation HYHouseDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情";
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellID"];
    }
    
    
    return cell;
}

@end
