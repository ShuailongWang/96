//
//  UIImage+Common.m


#import "UIImage+Common.h"

@implementation UIImage (Common)

+(UIImage *)imageWithColor:(UIColor *)aColor{
    return [UIImage imageWithColor:aColor withFrame:CGRectMake(0, 0, 1, 1)];
}

+(UIImage *)imageWithColor:(UIColor *)aColor withFrame:(CGRect)aFrame{
    
    UIGraphicsBeginImageContext(aFrame.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [aColor CGColor]);
    
    CGContextFillRect(context, aFrame);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}


- (BOOL)hasAlpha{
    CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(self.CGImage);
    return (alphaInfo == kCGImageAlphaFirst || alphaInfo == kCGImageAlphaLast ||
            alphaInfo == kCGImageAlphaPremultipliedFirst || alphaInfo == kCGImageAlphaPremultipliedLast);
}


- (UIImage *)croppedImageWithFrame:(CGRect)frame{
    UIImage *croppedImage = nil;
    UIGraphicsBeginImageContextWithOptions(frame.size, ![self hasAlpha], self.scale);
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextTranslateCTM(context, -frame.origin.x, -frame.origin.y);
        [self drawAtPoint:CGPointZero];
        
        croppedImage = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();
    
    return [UIImage imageWithCGImage:croppedImage.CGImage scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
}

//图片压缩到指定大小
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize{
    UIImage *sourceImage = self;
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    
    if (CGSizeEqualToSize(imageSize, targetSize) == NO){
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth= width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else if (widthFactor < heightFactor)
        {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    UIGraphicsBeginImageContext(targetSize); // this will crop
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width= scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil)
        NSLog(@"could not scale image");
    
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
}

@end
