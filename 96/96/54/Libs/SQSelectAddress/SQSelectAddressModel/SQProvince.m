//
//  SQProvince.m
//  SQSelectAddress
//
//  Created by Money on 2017/1/3.
//  Copyright © 2017年 SQ. All rights reserved.
//

#import "SQProvince.h"
#import "SQCity.h"

@implementation SQProvince

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init])
    {
        self.code = dict[@"id"];
        self.name = dict[@"name"];
        self.children = [SQCity citysWithArray:dict[@"children"]];
    }
    return self;
}

+ (instancetype)provinceWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

+ (NSArray *)provinces
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"class4new" ofType:@"json"];
    NSString *cityString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    id array = [self responseDataJSON:cityString];
    NSMutableArray *citys = [NSMutableArray array];
    
    if ([array isKindOfClass:[NSArray class]])
    {
        for (NSDictionary *dict in array)
        {
            [citys addObject:[self provinceWithDictionary:dict]];
        }
    }
    return (NSArray *)citys;
}

+(id)responseDataJSON:(NSString *)responseString
{
    NSData *data = [responseString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    id dataSource = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    return dataSource;
}

@end
