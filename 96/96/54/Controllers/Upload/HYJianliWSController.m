//
//  HYJianliWSController.m
//  96
//
//  Created by WSL on 17/1/9.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYJianliWSController.h"
#import "HYTextFieldCell.h"
#import "HYSectionHeadView.h"
#import "HYJianLiModel.h"

@interface HYJianliWSController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *myTableView;
@property (strong, nonatomic) NSArray *titleArr;
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
    return self.titleArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    HYJianLiModel *model = self.titleArr[section];
    return model.Items.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
            if (nil == cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
            }
            return cell;
        } else if (indexPath.row == 1){
            HYTextFieldCell *cell = [HYTextFieldCell cellWithTableView:tableView NSIndexPath:indexPath];
            
            HYJianLiModel *mode = self.titleArr[indexPath.section];
            NSArray *arr = mode.Items;
            NSDictionary *dict = arr[1];
            cell.titleLabel.text = dict[@"Title"];
            cell.subText.placeholder = dict[@"SubTitle"];
            
            return cell;
        }
    }
    HYTextFieldCell *cell = [HYTextFieldCell cellWithTableView:tableView NSIndexPath:indexPath];
    HYJianLiModel *mode = self.titleArr[indexPath.section];
    NSArray *arr = mode.Items;
    NSDictionary *dict = arr[indexPath.row];
    cell.titleLabel.text = dict[@"Title"];
    cell.subText.placeholder = dict[@"SubTitle"];
    if ((indexPath.section == 0 && (indexPath.row == 2 || indexPath.row == 3)) || (indexPath.section == 1 && indexPath.row == 2)) {
        //右边箭头
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}
// 组的头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSIndexPath *indexPath = [NSIndexPath indexPathWithIndex:section];
    HYSectionHeadView *headView = [[HYSectionHeadView alloc]initWithFrame:CGRectMake(10, 0, KScreen_Width - 20, 40)];
    HYJianLiModel *mode = self.titleArr[indexPath.section];
    headView.nameLabel.text = mode.ItemTitle;
    return headView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}





-(NSArray *)titleArr{
    if (nil == _titleArr) {
        _titleArr = [HYJianLiModel HYJianLiModelWithArray];
    }
    return _titleArr;
}
@end
