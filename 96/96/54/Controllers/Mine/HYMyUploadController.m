//
//  HYMyUploadController.m
//  96
//
//  Created by admin on 17/2/4.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYMyUploadController.h"
#import "HYMyUploadCell.h"

@interface HYMyUploadController ()<UITableViewDataSource, UITableViewDelegate, HYMyUploadCellDelegate>

@property (nonatomic, strong) UITableView *myTableView;

@end

static NSString *UITableViewcellID = @"UITableViewcellID";
static NSString *HYMyUploadCellID = @"HYMyUploadCellID";

@implementation HYMyUploadController

- (void)viewDidLoad {
    [super viewDidLoad];

     [self setupUI];
}

-(void)setupUI{
    if (nil == _myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.backgroundColor = kClearColor;
        _myTableView.bounces = NO;
        _myTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        [self.view addSubview:_myTableView];
    }
}


#pragma mark - UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HYMyUploadCell *cell = [HYMyUploadCell cellWithTableView:tableView NSIndexPath:indexPath];
    //选中后没有颜色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 190;
}

#pragma mark -HYMyUploadCellDelegate
-(void)HYMyUploadCell:(HYMyUploadCell *)myUploadCell clickButton:(NSInteger)senderTag{
    switch (senderTag) {
            //刷新
        case 251:
            
            break;
            //分享
        case 252:
            
            break;
            //更多
        case 253:
            [self clickMoreButton:myUploadCell];
            break;
            //恢复
        case 254:
            [self clickResumeButton:myUploadCell];
            break;
        default:
            break;
    }
}

//点击更多
-(void)clickMoreButton:(HYMyUploadCell *)myUploadCell{
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *edidt = [UIAlertAction actionWithTitle:@"编辑信息" style:UIAlertActionStyleDefault handler:^(UIAlertAction *  action) {
        //判断类型,进入相应的编辑界面
        
    }];
    UIAlertAction *delete = [UIAlertAction actionWithTitle:@"删除信息" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self clickDeleteButton:myUploadCell];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [actionSheet addAction:edidt];
    [actionSheet addAction:delete];
    [actionSheet addAction:cancel];
    [self presentViewController:actionSheet animated:YES completion:nil];
}

//删除
-(void)clickDeleteButton:(HYMyUploadCell *)myUploadCell{
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定要删除吗?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *OK = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *  action) {
        [myUploadCell hide];
        
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [actionSheet addAction:cancel];
    [actionSheet addAction:OK];
    [self presentViewController:actionSheet animated:YES completion:nil];
}
//恢复
-(void)clickResumeButton:(HYMyUploadCell *)myUploadCell{
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定要恢复吗?" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *OK = [UIAlertAction actionWithTitle:@"恢复" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *  action) {
        [myUploadCell show];
        
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [actionSheet addAction:cancel];
    [actionSheet addAction:OK];
    [self presentViewController:actionSheet animated:YES completion:nil];
}

@end
