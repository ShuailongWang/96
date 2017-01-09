//
//  UITextView+Extension.h
//

#import <UIKit/UIKit.h>


@interface UITextView (Extension)

@property (nonatomic,strong) UILabel *placeholderLabel;//占位符
@property (nonatomic,strong) IBInspectable NSString *placeholder;//占位符
@property (copy, nonatomic) NSNumber *limitLength;//限制字数


@end
