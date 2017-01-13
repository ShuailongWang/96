//
//  SQChinaCity.m
//  SQSelectAddress
//
//  Created by Money on 2017/1/3.
//  Copyright © 2017年 SQ. All rights reserved.
//

#import "SQChinaCity.h"

@implementation SQChinaCity

- (BOOL)isEqual:(SQChinaCity *)object
{
    return [self.code isEqualToString:[object code]];
}

@end
