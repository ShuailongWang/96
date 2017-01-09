//
//  HYRegisterBtn.m
//  General
//
//  Created by WSL on 17/1/4.
//  Copyright © 2017年 王帅龙. All rights reserved.
//

#import "HYRegisterBtn.h"

@implementation HYRegisterBtn

#pragma mark - 按钮内部布局子控件的方法
// 重新调整图片框和label的位置
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    // 互换位置
    self.imageView.x = 1;
    self.titleLabel.x = self.imageView.right;
    
    
}
@end
