//
//  HYFreshModel.m
//  96
//
//  Created by admin on 17/1/18.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYFreshModel.h"

@implementation HYFreshModel


+(NSArray *)FreshModelWithArray{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"shengXian.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[HYFreshModel yy_modelWithDictionary:dict]];
    }
    return arrayM.copy;
    
}

@end
