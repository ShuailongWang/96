//
//  SQCity.m
//  SQSelectAddress
//
//  Created by Money on 2017/1/3.
//  Copyright © 2017年 SQ. All rights reserved.
//

#import "SQCity.h"
#import "SQCounty.h"

@implementation SQCity

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init])
    {
        self.code = dict[@"id"];
        self.name = dict[@"name"];
        self.children = [SQCounty countiesWithArray:dict[@"children"]];
    }
    return self;
}

+ (instancetype)cityWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

+ (NSArray *)citysWithArray:(NSArray *)array
{
    NSMutableArray *citysArray = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [citysArray addObject:[self cityWithDictionary:dict]];
    }
    return citysArray;
}

@end
