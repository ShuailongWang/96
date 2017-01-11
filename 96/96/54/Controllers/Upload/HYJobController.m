//
//  HYJobController.m
//  96
//
//  Created by WSL on 17/1/9.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYJobController.h"
#import "HYJobCell.h"

@interface HYJobController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong,nonatomic) UILabel *titleLabel;
@property (strong,nonatomic) UILabel *tipLabel;
@property (strong,nonatomic) TPKeyboardAvoidingTableView *myTableView;
@property (strong,nonatomic) NSArray *titleArr;

@end

@implementation HYJobController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"填写发布信息";
    [self setupUI];
}


-(void)setupUI{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(clickRightButton)];
    if (nil == _myTableView) {
        _myTableView = [[TPKeyboardAvoidingTableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.bounces = NO;
        _myTableView.backgroundColor = [UIColor whiteColor];
        _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width, 80)];
        if (nil == _titleLabel) {
            _titleLabel = [UILabel labelWithTitle:@"我们俩" fontSize:15 textAlignment:NSTextAlignmentLeft];
            _titleLabel.frame = CGRectMake(10, 10, KScreen_Width -20, 21);
            [headView addSubview:_titleLabel];
        }
        if (nil == _tipLabel) {
            _tipLabel = [UILabel labelWithTitle:@"您的账户还可以发布3条免费信息." fontSize:15 textColor: [UIColor redColor] textAlignment:NSTextAlignmentLeft];
            _tipLabel.frame = CGRectMake(10, _titleLabel.bottom + 5, KScreen_Width - 20, 21);
            [headView addSubview:_tipLabel];
        }
        
        _myTableView.tableHeaderView = headView;
        _myTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        [self.view addSubview:_myTableView];
    }
}

-(void)clickRightButton{
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"发布成功后展示到职位列表" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *canAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAcxtion = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        [SVProgressHUD showSuccessMsg:@"正在发布,请稍后..."];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
            
            [NSObject showSuccessMsg:@"发布成功"];
            [self.navigationController popViewControllerAnimated:YES];
        });
    }];
    [actionSheet addAction:canAction];
    [actionSheet addAction:okAcxtion];
    [self presentViewController:actionSheet animated:YES completion:nil];
}
-(void)dealloc{
    [SVProgressHUD dismiss];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.titleArr[section] count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HYJobCell *cell = [HYJobCell cellWithTableView:tableView NSIndexPath:indexPath];
    
    NSArray *arr = self.titleArr[indexPath.section];
    NSDictionary *dict = arr[indexPath.row];
    cell.titleLabel.text = dict[@"TiTle"];
    cell.subText.placeholder = dict[@"SubTiTle"];

    if (indexPath.section == 0 && (indexPath.row ==0 || indexPath.row == 3)) {
        cell.rightImageView.hidden = YES;
    }
    if (indexPath.section == 1) {
        cell.rightImageView.hidden = YES;
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(NSArray *)titleArr{
    if (nil == _titleArr) {
        _titleArr = @[
                      @[@{
                            @"TiTle" : @"职位名称",
                            @"SubTiTle" : @"请填写职位名称"
                            },
                        @{
                            @"TiTle" : @"薪资水平",
                            @"SubTiTle" : @"请选择薪资水平"
                            },
                        @{
                            @"TiTle" : @"工作区域",
                            @"SubTiTle" : @"海淀 西三旗"
                            },
                        @{
                            @"TiTle" : @"详细地址",
                            @"SubTiTle" : @"大马路中间"
                            },
                        @{
                            @"TiTle" : @"职位类别",
                            @"SubTiTle" : @"请选择职位类别"
                            },
                        @{
                            @"TiTle" : @"工作年限",
                            @"SubTiTle" : @"不限"
                            },
                        @{
                            @"TiTle" : @"任务要求",
                            @"SubTiTle" : @"请填写岗位职责和要求"
                            }],
                      @[@{
                              @"TiTle" : @"联系人",
                              @"SubTiTle" : @"请填写联系人"
                              },
                          @{
                              @"TiTle" : @"联系电话",
                              @"SubTiTle" : @"请填写联系电话"
                              }]
                      ];
    }
    return _titleArr;
}

@end
