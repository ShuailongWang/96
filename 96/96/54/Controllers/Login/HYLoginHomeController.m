//
//  HYLoginHomeController.m
//  General
//
//  Created by WSL on 17/1/3.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYLoginHomeController.h"
#import "HYLoginController.h"

@interface HYLoginHomeController ()<UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong,nonatomic) UILabel *titleLabel;
@property (strong,nonatomic) UITableView *leftTableView;
@property (strong,nonatomic) UITableView *rightTableView;
@property (strong,nonatomic) UIButton *leftBtn;
@property (strong,nonatomic) UIButton *rightBtn;

@end

static NSString *LeftTableViewCellID = @"LeftTableViewCellID";
static NSString *RightTableViewCellID = @"RightTableViewCellID";

@implementation HYLoginHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航控制器的代理为self
    self.navigationController.delegate = self;
    
    [self setupUI];
}
#pragma mark - UINavigationControllerDelegate
// 将要显示控制器
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断要显示的控制器是否是自己
    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
    
    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
}

-(void)setupUI{
    CGFloat magrin = 40;
    CGFloat titleWidth = KScreen_Width - magrin;
    CGFloat tableWidth = (KScreen_Width - 60) / 2;
    CGFloat tableHeight = KScreen_Height - magrin - 200;
    if (nil == _titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, magrin, titleWidth, 30)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"我是标题";
        [self.view addSubview:_titleLabel];
    }
    if (nil == _leftTableView) {
        _leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(20, _titleLabel.bottom + 40, tableWidth, tableHeight) style:UITableViewStylePlain];
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
        [_leftTableView registerClass:[UITableViewCell class] forCellReuseIdentifier: LeftTableViewCellID];
        [self.view addSubview:_leftTableView];
    }
    if (nil == _rightTableView) {
        _rightTableView = [[UITableView alloc]initWithFrame:CGRectMake(_leftTableView.right + 20, _titleLabel.bottom + 40, tableWidth, tableHeight) style:UITableViewStylePlain];
        _rightTableView.delegate = self;
        _rightTableView.dataSource = self;
        [_rightTableView registerClass:[UITableViewCell class] forCellReuseIdentifier: RightTableViewCellID];
        [self.view addSubview:_rightTableView];
    }
    if (nil == _leftBtn) {
        _leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, _leftTableView.bottom + 30, tableWidth, 50)];
        _leftBtn.tag = 1;
        [_leftBtn setTitle:@"登陆" forState:UIControlStateNormal];
        _leftBtn.backgroundColor = [UIColor blueColor];
        [_leftBtn addTarget:self action:@selector(clickLoginButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_leftBtn];
    }
    if (nil == _rightBtn) {
        _rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(_leftBtn.right + 20, _rightTableView.bottom + 30, tableWidth, 50)];
        _rightBtn.tag = 2;
        [_rightBtn setTitle:@"登陆" forState:UIControlStateNormal];
        _rightBtn.backgroundColor = [UIColor redColor];
        [_rightBtn addTarget:self action:@selector(clickLoginButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_rightBtn];
    }
}

#pragma mark - 点击登陆按钮
-(void)clickLoginButton:(UIButton*)sender{
    
    HYLoginController *loginVC = [[HYLoginController alloc]init];
    loginVC.index = sender.tag;
    [self presentViewController: loginVC animated:YES completion:nil];
}

#pragma mark - UITableViewdelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.leftTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LeftTableViewCellID forIndexPath:indexPath];
        
        cell.textLabel.text = [NSString stringWithFormat:@"这是第%zd个", indexPath.row];
        
        return cell;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:RightTableViewCellID forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"这是第%zd个", indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == self.leftTableView) {
        
    }
    
    
}


@end
