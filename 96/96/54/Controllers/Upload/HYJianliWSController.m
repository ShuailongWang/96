//
//  HYJianliWSController.m
//  96
//
//  Created by WSL on 17/1/9.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYJianliWSController.h"
#import "HYJobCell.h"

@interface HYJianliWSController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong,nonatomic) UITableView *myTableView;
@property (strong,nonatomic) NSArray *titleArr;

@end

@implementation HYJianliWSController

- (void)viewDidLoad {
    [super viewDidLoad];

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
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        return 6;
    }
    return 1;
}


-(NSArray *)titleArr{
    if (nil == _titleArr) {
        _titleArr = @[
                      @[@{@"TiTle": @"您的简历不完善, 90%的企业更愿意联系完整的简历, 完善后可提升8倍的求职效果!"}],
                      @[@{@"TiTle": @"最后一份工作"},
                        @{@"TiTle" : @"公司名称", @"SubTiTle" : @"请输入公司名称"},
                        @{@"TiTle" : @"职位名称", @"SubTiTle" : @"请输入职位名称"},
                        @{@"TiTle" : @"开始时间", @"SubTiTle" : @"请选择开始时间"},
                        @{@"TiTle" : @"结束时间", @"SubTiTle" : @"请选择结束时间"}
                        ],
                      @[@{@"TiTle": @"我的最高学历"}],
                      @[@{@"TiTle": @"我的亮点"}]
                      ];
    }
    return _titleArr;
}

@end
