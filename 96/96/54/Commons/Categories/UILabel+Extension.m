//
//  UILabel+Extension.m
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)


+(UILabel *)labelWithTitle:(NSString*)title fontSize:(CGFloat)fontSize textAlignment:(NSTextAlignment)textAlignment{
    UILabel *label = [self createLabel];
    
    label.text = title;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textAlignment = textAlignment;
    
    return label;
}

+(UILabel *)labelWithTitle:(NSString*)title{
    UILabel *label = [self createLabel];
    
    label.text = title;
    
    return label;
}

+(UILabel *)labelWithTitle:(NSString*)title textColor:(UIColor*)textColor textAlignment:(NSTextAlignment)textAlignment{
    UILabel *label = [self createLabel];
    
    label.text = title;
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    
    return label;
}

+(UILabel *)labelWithTitle:(NSString*)title fontSize:(CGFloat)fontSize textColor:(UIColor*)textColor textAlignment:(NSTextAlignment)textAlignment{
    UILabel *label = [self createLabel];
    
    label.text = title;
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textAlignment = textAlignment;
    
    return label;
}

+(UILabel*)createLabel{
    UILabel *label = [[UILabel alloc]init];
    label.numberOfLines = 0;
    return label;
}



@end
