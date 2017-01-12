//
//  NSString+Common.m


#import "NSString+Common.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Common)

// 根据文字的长度返回height
- (CGFloat)getHeightWithFont:(CGFloat)fontSize constrainedToSize:(CGSize)size{
    return [self getSizeWithFont:fontSize constrainedToSize:size].height;
}
- (CGFloat)getWidthWithFont:(CGFloat)fontSize constrainedToSize:(CGSize)size{
    return [self getSizeWithFont:fontSize constrainedToSize:size].width;
}
- (CGSize)getSizeWithFont:(CGFloat)fontSize constrainedToSize:(CGSize)size{
    CGSize resultSize = CGSizeZero;
    
    if (self.length <= 0) {
        return resultSize;
    }
    
    resultSize = [self boundingRectWithSize:size options:(NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]} context:nil].size;
    
    resultSize = CGSizeMake(MIN(size.width, ceilf(resultSize.width)), MIN(size.height, ceilf(resultSize.height)));
    
    return resultSize;
}

+ (BOOL)isNULLString:(NSString *)string {
    return [string isEqualToString:@""] || string == nil || string.length == 0 || [string isKindOfClass:[NSNull class]];
}

- (NSString *)md5Str {
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}


- (BOOL)isMobile {
    
    if (self.length != 11) return NO;
    
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189,181(增加)
     */
    NSString * MOBIL = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[2378])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189,181(增加)
     22         */
    NSString * CT = @"^1((33|53|8[019])[0-9]|349)\\d{7}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBIL];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:self]
         || [regextestcm evaluateWithObject:self]
         || [regextestct evaluateWithObject:self]
         || [regextestcu evaluateWithObject:self])) {
        return YES;
    }
    
    return NO;
}

-(BOOL)isValidateEmail{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailRegex];
    
    return [emailTest evaluateWithObject:self];
    
}




-(NSMutableAttributedString*)AttributedWithRange:(NSInteger)location length:(NSInteger)length  fontSize:(CGFloat)fontSize{
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString: self];
    
    [AttributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:NSMakeRange(location, length)];
    
    [AttributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(location, length)];
    
    
    return AttributedStr;
}









@end
