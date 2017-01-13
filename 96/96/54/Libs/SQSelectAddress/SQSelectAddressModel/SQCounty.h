//
//  SQCounty.h
//  SQSelectAddress
//
//  Created by Money on 2017/1/3.
//  Copyright © 2017年 SQ. All rights reserved.
//

#import "SQChinaCity.h"

/**
 县、区
 */
@interface SQCounty : SQChinaCity

///**
// 城市ID
// */
//@property (nonatomic, copy) NSString *code;
//
///**
// 城市名字
// */
//@property (nonatomic, copy) NSString *name;
//
///**
// 城市下面的子城市
// */
//@property (nonatomic, strong) NSArray *children;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

+ (instancetype)countyWithDictionary:(NSDictionary *)dict;

+ (NSArray *)countiesWithArray:(NSArray *)array;

@end
