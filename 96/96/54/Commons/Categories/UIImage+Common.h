//
//  UIImage+Common.h


#import <UIKit/UIKit.h>

@interface UIImage (Common)


+(UIImage *)imageWithColor:(UIColor *)aColor;
+(UIImage *)imageWithColor:(UIColor *)aColor withFrame:(CGRect)aFrame;

- (UIImage *)croppedImageWithFrame:(CGRect)frame;

- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;

@end
