//
//  SQSelectAddressModel.h
//  SQSelectAddress
//
//  Created by Money on 2017/1/3.
//  Copyright © 2017年 SQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SQSelectAddressModelDelegate <NSObject>

@optional

/**
 城市地址模型加载完成
 */
- (void)SQSelectAddressLibraryLoadingCompleted;

@end

@interface SQSelectAddressModel : NSObject

@property (nonatomic, weak) id <SQSelectAddressModelDelegate> delegate;

/**
 城市模型
 */
@property (nonatomic, copy, readonly) NSArray *dataSource;

/**
 *  加载城市地址选择模型
 */
- (void)loadingAddressLibrary;

@end
