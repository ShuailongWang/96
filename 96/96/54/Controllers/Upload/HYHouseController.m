//
//  HYHouseController.m
//  96
//
//  Created by WSL on 17/1/11.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYHouseController.h"
#import "HYHouseSectionCell.h"

@interface HYHouseController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong,nonatomic) UITableView *myTableView;
@property (strong,nonatomic) NSArray *array;

@end

@implementation HYHouseController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"求购";
    
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
    
    [SVProgressHUD show];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
        
        [self.navigationController popViewControllerAnimated:YES];
    });
}




-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.array.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.array[section] count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1 && indexPath.row == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellID"];
        if (nil == cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCellID"];
        }
        UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 10, KScreen_Width - 20, 80)];
        textView.placeholder = @"至少10个字, 可填写对周边环境及商业配套的要求等等";
        textView.limitLength = @500;
        [cell.contentView addSubview:textView];
        return cell;
    }
    
    NSArray *arr = self.array[indexPath.section];
    NSDictionary *dict = arr[indexPath.row];
    
    HYHouseSectionCell *cell = [HYHouseSectionCell cellWithTableView:tableView NSIndexPath:indexPath];
    cell.titleLabel.text = dict[@"Title"];
    cell.subText.placeholder = dict[@"SubTitle"];
    if (indexPath.section == 0) {
        if (indexPath.row == 0 || indexPath.row == 1) {
            [cell.rightLabel setHidden:YES];
        }else{
            [cell.rightView setHidden:YES];
            cell.rightLabel.text = dict[@"RightLabel"];
        }
    }else{
        [cell.rightView setHidden:YES];
        [cell.rightLabel setHidden:YES];
    }
    [cell.userBtn setHidden:YES];
    [cell.mediationBtn setHidden:YES];
    if (indexPath.section == 2 && indexPath.row == 2) {
        [cell.userBtn setHidden:NO];
        [cell.mediationBtn setHidden:NO];
        [cell.subText setHidden:YES];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1 && indexPath.row == 1) {
        return 100;
    }
    return 45;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

-(NSArray *)array{
    if (nil == _array) {
        _array = @[
                   @[@{@"Title":@"区域", @"SubTitle":@"请选择区域"},
                     @{@"Title":@"户型", @"SubTitle":@"请选择户型"},
                     @{@"Title":@"面积", @"SubTitle":@"请输入房源面积", @"RightLabel": @"平方"},
                     @{@"Title":@"价格", @"SubTitle":@"请输入您期望的价格", @"RightLabel": @"万元"}],
                   @[@{@"Title":@"标题", @"SubTitle":@"标题为8-50字,不能填写联系方式"},
                     @{}],
                   @[@{@"Title":@"联系人", @"SubTitle":@"2-6个字"},
                     @{@"Title":@"手机号", @"SubTitle":@"请输入手机号"},
                     @{@"Title":@"身份", @"SubTitle":@""}]
                   ];
    }
    return _array;
}

@end
