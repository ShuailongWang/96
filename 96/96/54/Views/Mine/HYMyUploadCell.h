//
//  HYMyUploadCell.h
//  96
//
//  Created by admin on 17/2/4.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HYMyUploadCell,HYMyUploadCellDelegate;
@protocol HYMyUploadCellDelegate <NSObject>

-(void)HYMyUploadCell:(HYMyUploadCell *)myUploadCell clickButton:(NSInteger)senderTag;

@end

@interface HYMyUploadCell : UITableViewCell

@property (weak, nonatomic) id<HYMyUploadCellDelegate> delegate;

- (void)hide;
- (void)show;
+ (instancetype)cellWithTableView:(UITableView *)tableView NSIndexPath:(NSIndexPath *)indexPath;

@end
