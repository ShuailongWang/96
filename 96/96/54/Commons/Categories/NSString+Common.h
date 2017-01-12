//
//  NSString+Common.h
//


#import <UIKit/UIKit.h>

@interface NSString (Common)

// 根据文字的长度返回height
- (CGFloat)getHeightWithFont:(CGFloat)fontSize constrainedToSize:(CGSize)size;
- (CGFloat)getWidthWithFont:(CGFloat)fontSize constrainedToSize:(CGSize)size;
- (CGSize)getSizeWithFont:(CGFloat)fontSize constrainedToSize:(CGSize)size;

+ (BOOL)isNULLString:(NSString *)string;

- (NSString *)md5Str;

- (BOOL)isMobile;
- (BOOL)isValidateEmail;


//富文本,返回红色字体,字号
-(NSMutableAttributedString*)AttributedWithRange:(NSInteger)location length:(NSInteger)length fontSize:(CGFloat)fontSize;
@end
