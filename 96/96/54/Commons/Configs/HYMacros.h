//
//  HYMacros.h
//  General
//
//  Created by WSL on 17/1/3.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#ifndef HYMacros_h
#define HYMacros_h

//服务器地址
#define kBaseUrl    @"http://127.0.0.1:8008/Student/"

//log打印
#ifdef DEBUG
#define DLog( s, ... ) NSLog( @"<%p %@:(line-%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )

#else
#    define DLog(...)
#endif

//版本判断
#define isIOS7                  ([[[UIDevice currentDevice]systemVersion]floatValue] >= 7.0)
#define isIOS6                  ([[[UIDevice currentDevice]systemVersion]floatValue] < 7.0)
#define isIOS8                  ([[[UIDevice currentDevice]systemVersion]floatValue] >=8.0)
#define isIOS9                  ([[[UIDevice currentDevice]systemVersion]floatValue] >=9.0)
#define isIOS10                 ([[[UIDevice currentDevice]systemVersion]floatValue] >=10.0)
#define isPad                   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//一些缩写
#define AppDelegateInstance     [[UIApplication sharedApplication] delegate]
#define kApplication            [UIApplication sharedApplication]
#define kKeyWindow              [UIApplication sharedApplication].keyWindow
#define kUserDefaults           [NSUserDefaults standardUserDefaults]
#define kNotificationCenter     [NSNotificationCenter defaultCenter]

//尺寸
#define kPageProportion [UIScreen mainScreen].bounds.size.width / 375
#define KScreen_Bounds  [UIScreen mainScreen].bounds
#define KScreen_Width   [UIScreen mainScreen].bounds.size.width
#define KScreen_Height  [UIScreen mainScreen].bounds.size.height
#define kAverageWidth(ave)   (KScreen_Width / ave)

//色值
#define RGBA(r, g, b, a)   [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)      RGBA(r, g, b, 1.0f)
#define kRandomColor    RGB(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255))
#define HEXColor(hex)   [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]

//颜色
#define kBagroundColor RGB(233, 239, 239)
#define kClearColor     [UIColor clearColor]

//获取沙盒路径
#define kDocumentPath   [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
#define kTempPath       NSTemporaryDirectory()
#define kCachePath     [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

//由角度获取弧度, 由弧度获取角度
#define degreesToRadian(x)      (M_PI * (x) / 180.0)
#define radianToDegrees(radian) (radian*180.0)/(M_PI)


//NavigationItem高
#define kNavigationHeight 64


















#endif /* HYMacros_h */
