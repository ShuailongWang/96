//
//  UITableView+CacheHeight.h
//  cell计算行高
//
//  Created by admin on 16/12/14.
//  Copyright © 2016年 北京奥泰瑞格科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (CacheHeight)

/**
 *
 *	用于缓存cell的行高
 */
@property (nonatomic, strong, readonly) NSMutableDictionary *cacheCellHeightDict;

/**
 *
 *	用于获取或者添加计算行高的cell，因为理论上只有一个cell用来计算行高，以降低消耗
 */
@property (nonatomic, strong, readonly) NSMutableDictionary *reuseCells;

@end
