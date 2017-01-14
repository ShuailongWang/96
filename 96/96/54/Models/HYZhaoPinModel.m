//
//  HYZhaoPinModel.m
//  96
//
//  Created by WSL on 17/1/13.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYZhaoPinModel.h"

@implementation HYZhaoPinModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key  {
    if([key isEqualToString:@"id"])
        self.ZPID = value;
}

+(NSArray *)ZhaoPinModelWithArray{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"zhaoPin" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[HYZhaoPinModel yy_modelWithDictionary:dict]];
    }
    return arrayM.copy;
    
}

@end
