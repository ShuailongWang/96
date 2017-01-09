//
//  UITableViewCell+CacheHeight.h
//  cell计算行高
//
//  Created by admin on 16/12/14.
//  Copyright © 2016年 北京奥泰瑞格科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableView+CacheHeight.h"


/**
 * 获取高度前会回调，需要在此BLOCK中配置数据，才能正确地获取高度
 */
typedef void(^CellBlock)(UITableViewCell *sourceCell);
typedef NSDictionary *(^CacheHeight)();

/**
 *	唯一键，通常是数据模型的id，保证唯一
 */
FOUNDATION_EXTERN NSString *const kCacheUniqueKey;

/**
 *	对于同一个model，如果有不同状态，而且不同状态下高度不一样，那么也需要指定
 */
FOUNDATION_EXTERN NSString *const kCacheStateKey;

/**
 *	用于指定更新某种状态的缓存，比如当评论时，增加了一条评论，此时该状态的高度若已经缓存过，则需要指定来更新缓存
 */
FOUNDATION_EXTERN NSString *const kRecalculateForStateKey;



@interface UITableViewCell (CacheHeight)

/************************************************************************
 *
 * @note UI布局必须放在UITableViewCell的初始化方法中：
 *
 * - initWithStyle:reuseIdentifier:
 *
 * 且必须指定_lastViewInCell才能生效
 ************************************************************************/

/**
 * 必传设置的属性，也就是在cell中的contentView内最后一个视图，用于计算行高
 * 例如，创建了一个按钮button作为在cell中放到最后一个位置，则设置为：self._lastVieInCell = button;
 * 即可。
 * 默认为nil，如果在计算时，值为nil，会crash (弃用)
 */
@property (nonatomic, strong) UIView *lastViewInCell;

/**
 *  当距离分割线的视图不确定时，可以将可能的所有视图放在这个数组里面，优先级低于上面的属性，也就是当`_lastViewInCell`有值时，`_lastViewsInCell`不起作用。(弃用)
 */
@property (nonatomic, strong) NSArray *lastViewsInCell;

/**
 * 可选设置的属性，默认为0，表示指定的_lastViewInCell到cell的bottom的距离
 * 默认为0.0
 */
@property (nonatomic, assign) CGFloat bottomOffsetToCell;

/**
 * 通过此方法来计算行高，需要在config中调用配置数据的API
 *
 * @param tableView 必传，为哪个tableView缓存行高
 * @param config     必须要实现，且需要调用配置数据的API
 *
 * @return 计算的行高
 */
+ (CGFloat)_heightForTableView:(UITableView *)tableView config:(CellBlock)config;

/**
 *	此API会缓存行高
 *
 *	@param tableView 必传，为哪个tableView缓存行高
 *	@param config 必须要实现，且需要调用配置数据的API
 *	@param cache  返回相关key
 *
 *	@return 行高
 */
+ (CGFloat)heightForTableView:(UITableView *)tableView config:(CellBlock)config cache:(CacheHeight)cache;

@end
