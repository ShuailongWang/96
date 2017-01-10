//
//  HYTypeCell.h
//  96
//
//  Created by WSL on 17/1/9.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import <UIKit/UIKit.h>


#define Title @"Title"
#define Icon  @"Icon"
#define CellHeight 200

@interface HYTypeCell : UITableViewCell

/// 按钮数据源
@property (nonatomic,strong) NSArray * dataArr;

/// 一页可容纳的最多按钮数 默认 8
@property (nonatomic,assign) NSInteger numberOfSinglePage;


@end
