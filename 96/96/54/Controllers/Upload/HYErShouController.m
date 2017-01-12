//
//  HYErShouController.m
//  96
//
//  Created by WSL on 17/1/12.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYErShouController.h"
#import "HYSectionHeadView.h"
#import "HYUserHeadCell.h"
#import "HYCommonCell.h"
#import "HYErShouTypeCell.h"

@interface HYErShouController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong,nonatomic) UITableView *myTableView;
@property (strong,nonatomic) UITextView *textView;

@end

@implementation HYErShouController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"发布信息";
    
    [self setupUI];
}

-(void)setupUI{
    if (nil == _myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        
        UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width, 50)];
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(5, 5, KScreen_Width/4*3, 40)];
        button.center = footView.center;
        [button setTitle:@"发布" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor redColor];
        [button addTarget:self action:@selector(clickSaveButton) forControlEvents:UIControlEventTouchUpInside];
        [footView addSubview:button];
        _myTableView.tableFooterView = footView;
        _myTableView.bounces = NO;
        [self.view addSubview:_myTableView];
    }
}
-(void)clickSaveButton{
    [NSObject showErrorMsg:@"正在发布信息..."];
    [SVProgressHUD show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
        [NSObject showErrorMsg:@"发布成功"];
        [self.navigationController popViewControllerAnimated:YES];
    });
}


#pragma mark - UitableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1 || section == 2) {
        return 2;
    }
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        HYUserHeadCell *cell = [HYUserHeadCell cellWithTableView:tableView NSIndexPath:indexPath];
        
        return cell;
    }else if(indexPath.section == 1 && indexPath.row == 1){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellID"];
        if (nil == cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCellID"];
        }
        [cell.contentView addSubview:self.textView];
        return cell;
    }else if(indexPath.section == 2 && indexPath.row == 1){
        HYErShouTypeCell *cell = [HYErShouTypeCell cellWithTableView:tableView NSIndexPath:indexPath];
        return cell;

    }
    HYCommonCell *cell = [HYCommonCell cellWithTableView:tableView NSIndexPath:indexPath];
    [cell.rightView setHidden:YES];
    [cell.yuanLabel setHidden:YES];
    if (indexPath.section == 3 && (indexPath.row == 0 || indexPath.row == 1)) {
        [cell.yuanLabel setHidden:NO];
    }
    if (indexPath.section == 1 && indexPath.row == 0) {
        cell.titleLabel.text = @"标 题";
        cell.subText.placeholder = @"一句话描述下宝贝吧!";
    }else if(indexPath.section == 2 && indexPath.row == 0){
        cell.titleLabel.text = @"物品类别";
        cell.subText.placeholder = @"笔记本电脑-笔记本";
    }else if(indexPath.section == 3){
        if (indexPath.row == 0) {
            cell.titleLabel.text = @"想买多少";
            cell.subText.placeholder = @"0";
        }else if (indexPath.row == 1) {
            cell.titleLabel.text = @"购入价格";
            cell.subText.placeholder = @"0";
        }else if (indexPath.row == 2) {
            cell.titleLabel.text = @"联系电话";
            cell.subText.placeholder = @"123456789";
        }else if (indexPath.row == 3) {
            cell.titleLabel.text = @"设置隐私保护, 隐藏您的真实号码";
            [cell.subText setHidden:YES];
        }else if (indexPath.row == 4) {
            cell.titleLabel.text = @"我的位置";
            [cell.rightView setHidden:NO];
        }
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 200;
    }else if (indexPath.section == 1 && indexPath.row == 1) {
        return 100;
    }else if(indexPath.section == 2 && indexPath.row == 1){
        return 117;
    }
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0 || section == 1) {
        return 0.01;
    }
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
// 组的头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HYSectionHeadView *headView = [[HYSectionHeadView alloc]initWithFrame:CGRectMake(10, 0, KScreen_Width - 20, 40)];
    headView.backgroundColor = RGB(239, 239, 244);
    headView.nameLabel.textColor = RGB(196, 196, 202);
    if (section == 0 || section == 1) {
        return nil;
    }else if (section == 2){
        headView.nameLabel.text = @"我的宝贝最\"个性\"";
    }else if (section == 3){
        headView.nameLabel.text = @"快来联系我";
    }
    return headView;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}



-(UITextView *)textView{
    if (nil == _textView){
        _textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 10, KScreen_Width-20, 70)];
        _textView.placeholder = @"补充下宝贝的来历, 成色, 亮点吧!";
    }
    return _textView;
}

@end
