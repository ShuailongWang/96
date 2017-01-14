//
//  HYZhaoPinModel.h
//  96
//
//  Created by WSL on 17/1/13.
//  Copyright © 2017年 王帅龙. All rights reserved.
/*
 {
 "id": 31186498421,
 "PositionID": 31186498421,
 "Number": "CC368740281J90250018000",
 "Name": "文字编辑",
 "CompanyNumber": "CC368740281",
 "CompanyAutoID": 36874028,
 "CompanyName": "北京哈福尔网络科技有限公司",
 "PublishTime": "01-13",
 "PublishTimeDt": "2017-01-13T00:00:00",
 "CityId": "530",
 "WorkCity": "北京",
 "Salary": "2001-4000元/月",
 "Salary60": "2千-4千",
 "Education": "大专",
 "CityDistrict": "",
 "HasAppliedPosition": false,
 "IsFastPosition": false,
 "JobType": "行政/后勤/文秘",
 "isFeedback": false,
 "WelfareTab": [
 {
 "0": "弹性工作"
 },
 {
 "1": "节日福利"
 }
 ],
 "WorkingExp": "不限",
 "Distance": 0,
 "feedbackRation": 1,
 "industry": "210500",
 "companyLogo": "http://img09.zhaopin.com/2012/other/mobile/mi/companyLogo/01/210500.png",
 "emplType": "全职",
 "applyType": "1",
 "positionURL": "http://jobs.zhaopin.com/368740281250018.htm"
 },
 */

#import <Foundation/Foundation.h>

@interface HYZhaoPinModel : NSObject

@property (copy, nonatomic) NSString *ZPID;
@property (copy, nonatomic) NSString *Name;
@property (copy, nonatomic) NSString *CompanyName;
@property (copy, nonatomic) NSString *PublishTime;
@property (copy, nonatomic) NSString *PublishTimeDt;
@property (copy, nonatomic) NSString *WorkCity;
@property (copy, nonatomic) NSString *WorkAddress;
@property (copy, nonatomic) NSString *Salary;
@property (copy, nonatomic) NSString *Salary60;
@property (copy, nonatomic) NSString *Education;
@property (copy, nonatomic) NSString *JobType;
@property (strong,nonatomic) NSArray *WelfareTab;
@property (copy, nonatomic) NSString *WorkingExp;
@property (copy, nonatomic) NSString *companyLogo;
@property (copy, nonatomic) NSString *emplType;
@property (copy, nonatomic) NSString *positionURL;

+(NSArray *)ZhaoPinModelWithArray;

@end


