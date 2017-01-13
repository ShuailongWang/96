//
//  SQChinaCitiesController.h
//  SQSelectAddress
//
//  Created by Money on 2017/1/3.
//  Copyright © 2017年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 选择城市的类型

 - SQSelectAddressTypeProvince: 选择省份
 - SQSelectAddressTypeCity: 选择市、地级市
 - SQSelectAddressTypeCounty: 选择县、区
 - SQSelectAddressTypeTown: 选择乡、镇
 */
typedef NS_ENUM(NSInteger, SQSelectAddressType) {
    SQSelectAddressTypeProvince = 0,
    SQSelectAddressTypeCity ,
    SQSelectAddressTypeCounty ,
    SQSelectAddressTypeTown
};

@class SQChinaCity, SQChinaCitiesController;
@protocol SQChinaCitiesControllerDelegate <NSObject>

@optional
- (void)chinaCitiesController:(SQChinaCitiesController *)cityController selectCity:(SQChinaCity *)chinaCity withType:(SQSelectAddressType)selectType;

@end

@interface SQChinaCitiesController : UIViewController

@property (nonatomic, weak) id <SQChinaCitiesControllerDelegate> delegate;

@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, assign) SQSelectAddressType selectType;

@end
