//
//  UITableViewCell+CacheHeight.m
//  cell计算行高
//
//  Created by admin on 16/12/14.
//  Copyright © 2016年 北京奥泰瑞格科技有限公司. All rights reserved.
//

#import "UITableViewCell+CacheHeight.h"
#import <objc/runtime.h>
#import "UITableView+CacheHeight.h"

NSString *const kCacheUniqueKey = @"kCacheUniqueKey";
NSString *const kCacheStateKey = @"kCacheStateKey";
NSString *const kRecalculateForStateKey = @"kRecalculateForStateKey";
NSString *const kCacheForTableViewKey = @"kCacheForTableViewKey";
const void *s__lastViewInCellKey = "s__lastViewInCellKey";
const void *s__bottomOffsetToCellKey = "s__bottomOffsetToCellKey";

@implementation UITableViewCell (CacheHeight)

#pragma mark - Public
+ (CGFloat)_heightForTableView:(UITableView *)tableView config:(CellBlock)config {
    UITableViewCell *cell = [tableView.reuseCells objectForKey:[[self class] description]];
    
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault
                           reuseIdentifier:nil];
        [tableView.reuseCells setObject:cell forKey:[[self class] description]];
    }
    
    if (config) {
        config(cell);
    }
    
    return [cell private__heightForTableView:tableView];
}

+ (CGFloat)heightForTableView:(UITableView *)tableView
                           config:(CellBlock)config
                            cache:(CacheHeight)cache {
    
    NSAssert(tableView, @"tableView is necessary param");
    
    if (cache) {
        NSDictionary *cacheKeys = cache();
        NSString *key = cacheKeys[kCacheUniqueKey];
        NSString *stateKey = cacheKeys[kCacheStateKey];
        NSString *shouldUpdate = cacheKeys[kRecalculateForStateKey];
        
        NSMutableDictionary *stateDict = tableView.cacheCellHeightDict[key];
        NSString *cacheHeight = stateDict[stateKey];
        
        if (tableView.cacheCellHeightDict.count == 0 || shouldUpdate.boolValue || cacheHeight == nil) {
            CGFloat height = [self _heightForTableView:tableView config:config];
            
            if (stateDict == nil) {
                stateDict = [[NSMutableDictionary alloc] init];
                tableView.cacheCellHeightDict[key] = stateDict;
            }
            
            [stateDict setObject:[NSString stringWithFormat:@"%lf", height] forKey:stateKey];
            
            return height;
        } else if (tableView.cacheCellHeightDict.count != 0
                   && cacheHeight != nil
                   && cacheHeight.integerValue != 0) {
            return cacheHeight.floatValue;
        }
    }
    
    return [self _heightForTableView:tableView config:config];
}
#pragma mark - Private
- (CGFloat)private__heightForTableView:(UITableView *)tableView {
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    
    CGFloat rowHeight = 0.0;
    
    for (UIView *bottomView in self.contentView.subviews) {
        if (rowHeight < CGRectGetMaxY(bottomView.frame)) {
            rowHeight = CGRectGetMaxY(bottomView.frame);
        }
    }
    
    rowHeight += self.bottomOffsetToCell;
    
    return rowHeight;
}

//
-(void)setLastViewInCell:(UIView *)lastViewInCell{
    objc_setAssociatedObject(self,
                             s__lastViewInCellKey,
                             lastViewInCell,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)lastViewInCell {
    return objc_getAssociatedObject(self, s__lastViewInCellKey);
}

//
-(void)setLastViewsInCell:(NSArray *)lastViewsInCell{
    objc_setAssociatedObject(self,
                             @selector(lastViewsInCell),
                             lastViewsInCell,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSArray *)lastViewsInCell {
    return objc_getAssociatedObject(self, _cmd);
}

//
-(void)setBottomOffsetToCell:(CGFloat)bottomOffsetToCell{
    objc_setAssociatedObject(self,
                             s__bottomOffsetToCellKey,
                             @(bottomOffsetToCell),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(CGFloat)bottomOffsetToCell{
    NSNumber *valueObject = objc_getAssociatedObject(self, s__bottomOffsetToCellKey);
    
    if ([valueObject respondsToSelector:@selector(floatValue)]) {
        return valueObject.floatValue;
    }
    
    return 0.0;
}

@end
