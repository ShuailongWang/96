//
//  SQChinaCity.h
//  SQSelectAddress
//
//  Created by Money on 2017/1/3.
//  Copyright © 2017年 SQ. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 中国城市
 */
@interface SQChinaCity : NSObject

/**
 城市ID
 */
@property (nonatomic, copy) NSString *code;

/**
 城市名字
 */
@property (nonatomic, copy) NSString *name;

/**
 城市下面的子城市
 */
@property (nonatomic, strong) NSArray *children;

@end
