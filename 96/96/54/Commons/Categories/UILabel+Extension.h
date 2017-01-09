//
//  UILabel+Extension.h
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)


/**
 设置label

 @param title    标题
 @param fontSize 字号
 @param textAlignment 对齐方式
 @return label
 */
+(UILabel *)labelWithTitle:(NSString*)title fontSize:(CGFloat)fontSize textAlignment:(NSTextAlignment)textAlignment;

/**
 设置label
 
 @param title    标题
 
 @return label
 */
+(UILabel *)labelWithTitle:(NSString*)title;

/**
 设置label
 
 @param title    标题
 @param textColor 颜色
 
 @return label
 */
+(UILabel *)labelWithTitle:(NSString*)title textColor:(UIColor*)textColor textAlignment:(NSTextAlignment)textAlignment;

+(UILabel *)labelWithTitle:(NSString*)title fontSize:(CGFloat)fontSize textColor:(UIColor*)textColor textAlignment:(NSTextAlignment)textAlignment;

@end
