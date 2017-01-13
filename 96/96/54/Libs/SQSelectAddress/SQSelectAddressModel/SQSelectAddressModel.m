//
//  SQSelectAddressModel.m
//  SQSelectAddress
//
//  Created by Money on 2017/1/3.
//  Copyright © 2017年 SQ. All rights reserved.
//

#import "SQSelectAddressModel.h"
#import "SQProvince.h"

@interface SQSelectAddressModel ()

@property (nonatomic, copy) NSArray *provinces;

@end

@implementation SQSelectAddressModel

/**
 *  初始化地址选择模型
 */
- (void)loadingAddressLibrary
{
    __weak SQSelectAddressModel *weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        weakSelf.provinces = [SQProvince provinces];
        dispatch_async(dispatch_get_main_queue(), ^{
            //    只能在主线程中执行的处理

            if (self.delegate && [self.delegate respondsToSelector:@selector(SQSelectAddressLibraryLoadingCompleted)])
            {
                [self.delegate SQSelectAddressLibraryLoadingCompleted];
            }
        });
    });
}

- (NSArray *)dataSource
{
    return self.provinces;
}

@end
