//
//  SQSelectAddressViewController.h
//  SQSelectAddress
//
//  Created by XiaoBao on 2017/1/2.
//  Copyright © 2017年 SQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SQProvince, SQCity, SQCounty, SQTown, SQSelectAddressViewController;
@protocol SQSelectAddressViewControllerDelegate <NSObject>

@optional

/**
 选择的详细地址和该地址地理编码Code

 @param selectController SQSelectAddressViewController
 @param address 详细地址
 @param townCode 地址编码
 */
- (void)selectAddressViewController:(SQSelectAddressViewController *)selectController selectedDetailAdreess:(NSString *)address townCode:(NSString *)townCode;

/**
 选择的地址所在的省份

 @param province 省份模型
 */
- (void)selectAddressViewControllerSelectedProvince:(SQProvince *)province;

/**
 选择的地址所在的市或直辖市

 @param city 市或市级县模型
 */
- (void)selectAddressViewControllerSelectedCity:(SQCity *)city;

/**
 选择的地址所在的县或区

 @param county 县或区模型
 */
- (void)selectAddressViewControllerSelectedCounty:(SQCounty *)county;

/**
 选择的地址所在的乡、镇

 @param town 乡、镇模型
 */
- (void)selectAddressViewControllerSelectedTown:(SQTown *)town;

@end

@interface SQSelectAddressViewController : UIViewController

@property (nonatomic, weak) id <SQSelectAddressViewControllerDelegate> delegate;

@end
