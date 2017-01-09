//
//  UITableView+CacheHeight.m
//  cell计算行高
//
//  Created by admin on 16/12/14.
//  Copyright © 2016年 北京奥泰瑞格科技有限公司. All rights reserved.
//

#import "UITableView+CacheHeight.h"
#import <objc/runtime.h>

static const void *__tableView_cache_CellHeight_Key = @"__tableView_cache_CellHeight_Key";
static const void *__tableView_reuse_CellHeight_Key = @"__tableView_reuse_CellHeight_Key";

@implementation UITableView (CacheHeight)

-(NSMutableDictionary *)cacheCellHeightDict{
    NSMutableDictionary *dict = objc_getAssociatedObject(self, __tableView_cache_CellHeight_Key);
    if (nil == dict) {
        dict = [[NSMutableDictionary alloc]init];
        
        objc_setAssociatedObject(self, __tableView_cache_CellHeight_Key, dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return dict;
}

-(NSMutableDictionary *)reuseCells{
    NSMutableDictionary *dict = objc_getAssociatedObject(self, __tableView_reuse_CellHeight_Key);
    if (nil == dict) {
        dict = [[NSMutableDictionary alloc]init];
        objc_setAssociatedObject(self, __tableView_reuse_CellHeight_Key, dict, OBJC_ASSOCIATION_RETAIN);
    }
    return dict;
}

@end
