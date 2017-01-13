//
//  SQTown.m
//  SQSelectAddress
//
//  Created by Money on 2017/1/3.
//  Copyright © 2017年 SQ. All rights reserved.
//

#import "SQTown.h"

@implementation SQTown

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        self.code = dict[@"id"];
        self.name = dict[@"name"];
    }
    return self;
}

+ (instancetype)townsWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

+ (NSArray *)townsWithArray:(NSArray *)array
{
    NSMutableArray *townsArray = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        [townsArray addObject:[self townsWithDictionary:dict]];
    }
    return townsArray;
}

@end
