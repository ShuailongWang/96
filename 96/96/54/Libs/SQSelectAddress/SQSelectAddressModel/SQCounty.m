//
//  SQCounty.m
//  SQSelectAddress
//
//  Created by Money on 2017/1/3.
//  Copyright © 2017年 SQ. All rights reserved.
//

#import "SQCounty.h"
#import "SQTown.h"

@implementation SQCounty

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init])
    {
        self.code = dict[@"id"];
        self.name = dict[@"name"];
        self.children = [SQTown townsWithArray:dict[@"children"]];
    }
    return self;
}

+ (instancetype)countyWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

+ (NSArray *)countiesWithArray:(NSArray *)array
{
    NSMutableArray *countyArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        [countyArray addObject:[self countyWithDictionary:dic]];
    }  
    return countyArray;

}

@end
