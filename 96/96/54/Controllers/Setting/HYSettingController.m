//
//  HYSettingController.m
//  General
//
//  Created by WSL on 17/1/5.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYSettingController.h"
#import "HYOpinionController.h"
#import "HYScoreController.h"
#import "HYBackPassController.h"

@interface HYSettingController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong,nonatomic) UITableView *myTableView;

@end

static NSString *HYSettingControllerCellID = @"HYSettingControllerCellID";

@implementation HYSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    
    [self setupUI];
}

-(void)setupUI{
    if (nil == _myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:HYSettingControllerCellID];
        [self.view addSubview:_myTableView];
    }
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    } else if (section == 1){
        return 3;
    }
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HYSettingControllerCellID forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"意见反馈";
        }else{
            cell.textLabel.text = @"给我评分";
        }
    }else if(indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"消息设置";
            UISwitch *mySwitch = [[UISwitch alloc]init];
            [mySwitch addTarget:self action:@selector(selectSwitch:) forControlEvents:UIControlEventTouchUpInside];
            
            //1.获取NSUserDefaults对象
            NSUserDefaults * userDef = [NSUserDefaults standardUserDefaults];
            mySwitch.on = [userDef boolForKey:@"HYSettingController_Switch"];

            cell.accessoryView = mySwitch;
            cell.accessoryType = UITableViewCellAccessoryNone;
        }else if (indexPath.row == 1){
            cell.textLabel.text = @"找回密码";
        }else{
            cell.textLabel.text = @"关于我们";
        }
    }else if(indexPath.section == 2) {
        cell.textLabel.text = @"退出登录";
        cell.textLabel.textColor = [UIColor redColor];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            HYOpinionController *opinionVC = [[HYOpinionController alloc]init];
            [self.navigationController pushViewController:opinionVC animated:YES];
        }else{
            HYScoreController *scoreVC = [[HYScoreController alloc]init];
            [self.navigationController pushViewController:scoreVC animated:YES];
        }
    }else if(indexPath.section == 1) {
        if (indexPath.row == 1){
            HYBackPassController *backPassVC = [[HYBackPassController alloc]init];
            [self.navigationController pushViewController:backPassVC animated:YES];
        }else{
            HYBaseController *baseVC = [[HYBaseController alloc]init];
            [self.navigationController pushViewController:baseVC animated:YES];
        }
    }else if(indexPath.section == 2) {
        [self showAlert];
    }
}

-(void)showAlert{
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"确认退出登录?" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
    
    [actionSheet addAction:cancelAction];
    [actionSheet addAction:okAction];
    [self presentViewController:actionSheet animated:YES completion:nil];
}

-(void)selectSwitch:(UISwitch*)sender{
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:sender.on forKey:@"HYSettingController_Switch"];
    [userDefaults synchronize];
}


@end
