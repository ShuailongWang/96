//
//  HYReusableHeadView.h
//  96
//
//  Created by admin on 17/1/19.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HYReusableHeadView : UICollectionReusableView

@property (nonatomic, copy) NSString *headName;


-(void)hideLabel;
-(void)showLabel;

@end
