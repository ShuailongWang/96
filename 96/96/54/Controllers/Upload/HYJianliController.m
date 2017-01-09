//
//  HYJianliController.m
//  96
//
//  Created by WSL on 17/1/9.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYJianliController.h"
#import "HYJianliCell.h"
#import "HYJobCell.h"
#import "HYJianliWSController.h"

@interface HYJianliController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong,nonatomic) UIView *headView;
@property (strong,nonatomic) UITableView *myTableView;
@property (strong,nonatomic) UILabel *headLabel;
@property (strong,nonatomic) NSArray *titleArr;

@end

@implementation HYJianliController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

-(void)setupUI{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"创建简历" style:UIBarButtonItemStylePlain target:self action:@selector(clickRightButton)];
    if (nil == _myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.backgroundColor = [UIColor whiteColor];
        _myTableView.tableHeaderView = self.headView;
        _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _myTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        [self.view addSubview:_myTableView];
    }
}
-(void)clickRightButton{
    
    [SVProgressHUD show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
        
        HYJianliWSController *jianliWS = [[HYJianliWSController alloc]init];
        [self.navigationController pushViewController:jianliWS animated:YES];
    });
    
}
-(void)dealloc{
    [SVProgressHUD dismiss];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.titleArr[section] count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *arr = self.titleArr[indexPath.section];
    NSDictionary *dict = arr[indexPath.row];
    if (indexPath.section == 0 && indexPath.row == 0) {
        HYJianliCell *cell = [HYJianliCell cellWithTableView:tableView NSIndexPath:indexPath];
        cell.titleLabel.text = dict[@"TiTle"];
        cell.subText.placeholder = dict[@"SubTiTle"];
        return cell;
    }
    
    HYJobCell *cell = [HYJobCell cellWithTableView:tableView NSIndexPath:indexPath];
    cell.titleLabel.text = dict[@"TiTle"];
    cell.subText.placeholder = dict[@"SubTiTle"];
    if (indexPath.section == 0 && indexPath.row == 4) {
        cell.rightImageView.hidden = YES;
    }
    if (indexPath.section == 2) {
        cell.subText.height = 90;
        cell.rightImageView.hidden = YES;
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 60;
    } else if(indexPath.section == 1) {
        return 60;
    }
    return 120;
}


-(NSArray *)titleArr{
    if (nil == _titleArr) {
        _titleArr = @[
                      @[@{
                            @"TiTle" : @"姓名",
                            @"SubTiTle" : @"请输入姓名"
                            },
                        @{
                            @"TiTle" : @"出生年份",
                            @"SubTiTle" : @"请选择您的出生年份"
                            },
                        @{
                            @"TiTle" : @"最高学历",
                            @"SubTiTle" : @"请选择您的最高学历"
                            },
                        @{
                            @"TiTle" : @"工作经验",
                            @"SubTiTle" : @"请选择您的工作经验"
                            },
                        @{
                            @"TiTle" : @"手机号码",
                            @"SubTiTle" : @"12345678901"
                            }],
                      @[
                          @{
                              @"TiTle" : @"期望工资",
                              @"SubTiTle" : @"请选择您期望的薪资"
                              },
                          @{
                              @"TiTle" : @"期望职位",
                              @"SubTiTle" : @"请选择您期望的职位"
                              },
                          @{
                              @"TiTle" : @"求职区域",
                              @"SubTiTle" : @"北京"
                              }
                          ],
                      @[
                        @{
                            @"TiTle" : @"自我评价",
                            @"SubTiTle" : @"请填写您的亮点或时间经验"
                            }]
                      ];
    }
    return _titleArr;
}

-(UIView *)headView{
    if (nil == _headView) {
        _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width, 180)];
        
        UIImageView *bgImage = [[UIImageView alloc]initWithFrame:_headView.bounds];
        bgImage.image = [UIImage imageNamed:@""];
        [_headView addSubview:bgImage];
        
        UIButton *iconBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 80, 80)];
        iconBtn.centerX = _headView.centerX;
        [iconBtn setBackgroundImage:[UIImage imageNamed:@"join_default_header"] forState:UIControlStateNormal];
        [iconBtn addTarget:self action:@selector(clickIconBtn) forControlEvents:UIControlEventTouchUpInside];
        [_headView addSubview:iconBtn];
        
        _headLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, iconBtn.bottom + 10, KScreen_Width - 10, 60)];
        _headLabel.font = [UIFont systemFontOfSize:15];
        _headLabel.textColor = [UIColor whiteColor];
        _headLabel.numberOfLines = 0;
        _headLabel.textAlignment = NSTextAlignmentCenter;
        _headLabel.text = @"点我上传头像\n别让简历淹没在人海里哦";
        [_headView addSubview:_headLabel];
    }
    return _headView;
}

-(void)clickIconBtn{
    
}

@end
