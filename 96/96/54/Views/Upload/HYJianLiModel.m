//
//  HYJianLiModel.m
//  96
//
//  Created by admin on 17/1/10.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYJianLiModel.h"

@implementation HYJianLiModel

+(NSArray *)HYJianLiModelWithArray{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Jianli.plist" ofType: nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[HYJianLiModel yy_modelWithDictionary:dict]];
    }
    return arrayM.copy;
    
}

@end
