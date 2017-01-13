//
//  SQCity.h
//  SQSelectAddress
//
//  Created by Money on 2017/1/3.
//  Copyright © 2017年 SQ. All rights reserved.
//

#import "SQChinaCity.h"

/**
 市、直辖市、地级市
 */
@interface SQCity : SQChinaCity

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

+ (instancetype)cityWithDictionary:(NSDictionary *)dict;

+ (NSArray *)citysWithArray:(NSArray *)array;

@end
