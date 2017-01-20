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

@end





@interface HYReusableFooterView : UICollectionReusableView

@property (nonatomic, copy) NSString *footName;
@property (copy,nonatomic) void(^myBlock)();

-(void)hideLabel;
-(void)showLabel;

@end
