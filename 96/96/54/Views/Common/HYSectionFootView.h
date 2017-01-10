//
//  HYSectionFootView.h
//  96
//
//  Created by WSL on 17/1/10.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYSectionFootView : UIView

@property (strong,nonatomic) UIButton *footButton;
@property (copy,nonatomic) void(^myBlock)();

@end
