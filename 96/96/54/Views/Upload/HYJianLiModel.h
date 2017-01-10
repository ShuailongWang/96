//
//  HYJianLiModel.h
//  96
//
//  Created by admin on 17/1/10.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYJianLiModel : NSObject

@property (nonatomic, copy) NSString *ItemTitle;
@property (nonatomic, strong) NSArray *Items;


+(NSArray *)HYJianLiModelWithArray;

@end
