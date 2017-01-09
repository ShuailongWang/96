//
//  HYNewsCell.h
//  96
//
//  Created by WSL on 17/1/8.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYNewsCell : UITableViewCell

-(void)showRedImage;
-(void)hideRedImage;

-(void)showLoginBtn;
-(void)hideloginBtn;

+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;

@end
