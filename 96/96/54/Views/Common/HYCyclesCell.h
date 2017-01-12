//
//  HYCyclesCell.h
//  96
//
//  Created by admin on 17/1/12.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import <UIKit/UIKit.h>

#define HYCyclesCellHeight      100
@interface HYCyclesCell : UITableViewCell

@property (copy,nonatomic) void(^myBlock)(NSInteger index);

@end
