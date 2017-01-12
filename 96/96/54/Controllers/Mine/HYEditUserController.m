//
//  HYEditUserController.m
//  General
//
//  Created by admin on 17/1/5.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYEditUserController.h"
#import "HYEditUserCell.h"
@interface HYEditUserController ()<UITableViewDelegate, UITableViewDataSource,UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong) TPKeyboardAvoidingTableView *myTableView;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *subName;
@end

static NSString *HYEditUserControllerCellID = @"HYEditUserControllerCellID";

@implementation HYEditUserController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

-(void)setupUI{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(clickTopButton)];
    if (nil == _myTableView) {
        _myTableView = [[TPKeyboardAvoidingTableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        [_myTableView registerClass:[HYEditUserCell class] forCellReuseIdentifier:HYEditUserControllerCellID];
        [self.view addSubview:_myTableView];
    }
}
-(void)clickTopButton{
    
    [NSObject showSuccessMsg:@"修改成功"];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UItableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HYEditUserCell *cell = [tableView dequeueReusableCellWithIdentifier: HYEditUserControllerCellID forIndexPath:indexPath];
    if (indexPath.section == 0) {
        cell.titleLabel.text = @"头像";
        if (self.image) {
            cell.subImgView.image = self.image;
        }else{
            cell.subImgView.image = [UIImage imageNamed:@"user"];
        }
        
        [cell.subImgView setHidden:NO];
        [cell.subText setHidden:YES];
        return cell;
    }
    if (indexPath.row == 0) {
        cell.titleLabel.text = @"用户名";
        cell.subText.placeholder = @"输入用户名";
        cell.subText.text = @"歪脖子";
        
    } else if (indexPath.row == 1) {
        cell.titleLabel.text = @"职位";
        cell.subText.placeholder = @"输入岗位";
        cell.subText.text = @"海贼王";
        
    } else if (indexPath.row == 2) {
        cell.titleLabel.text = @"联系人";
        cell.subText.placeholder = @"输入联系人";
        cell.subText.text = @"老王";
        
    } else if (indexPath.row == 3) {
        cell.titleLabel.text = @"手机";
        cell.subText.placeholder = @"输入手机";
        cell.subText.text = @"15097695499";
        
    }  else if (indexPath.row == 4) {
        cell.titleLabel.text = @"邮箱";
        cell.subText.placeholder = @"输入邮箱";
        cell.subText.text = @"358274@qq.com";
        
    }
    
    [cell.subImgView setHidden:YES];
    [cell.subText setHidden:NO];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 110;
    }
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *takePhoto = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction *  action) {
            
            [self takePhoto];
        }];
        UIAlertAction *library = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            [self chooseImageFromLibary];
        }];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [actionSheet addAction:takePhoto];
        [actionSheet addAction:library];
        [actionSheet addAction:cancel];
        [self presentViewController:actionSheet animated:YES completion:nil];
    }
}
//照相
- (void)takePhoto{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.delegate = self;
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:nil];
}

//相册
- (void)chooseImageFromLibary{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.allowsEditing = YES;
    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    //选择的照片
    UIImage *image = info[UIImagePickerControllerEditedImage];
    
    
    //照相后,保存原图片到相册中
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera && image) {
        UIImageWriteToSavedPhotosAlbum(image, self, nil, NULL);
    }
    
    //图片赋值
    self.image = [UIImage imageWithData:UIImageJPEGRepresentation(image, 0.5)];
    
    //选择照片后,删除model出来的controller
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    [self.myTableView reloadData];
}



@end
