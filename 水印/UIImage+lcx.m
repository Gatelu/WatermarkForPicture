//
//  UIImage+lcx.m
//  水印
//
//  Created by Gate on 16/1/2.
//  Copyright © 2016年 Gate. All rights reserved.
//

#import "UIImage+lcx.h"

@implementation UIImage (lcx)
+ (UIImage *)waterImageWithBg:(NSString *)Bgimage andWater:(NSString *)logo andTitle:(NSString *)title{
    UIImage *oldImage = [UIImage imageNamed:Bgimage];
    UIGraphicsBeginImageContextWithOptions(oldImage.size, NO, 0.0);
    //画背景
    [oldImage drawInRect:CGRectMake(0, 0, oldImage.size.width, oldImage.size.height)];
    //画水印
    NSString *str = title;
    //    UIImage *waterImage = [UIImage imageNamed:@"logo"];
    //
    //    [waterImage drawInRect:CGRectMake(oldImage.size.width - 75,oldImage.size.height -  31, 70, 26)];
    //
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor redColor];
    [str drawInRect:CGRectMake(oldImage.size.width - 75,oldImage.size.height -  31, 70, 26) withAttributes:attrs];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    return newImage;
}
+ (instancetype)circleImageWithImageName:(NSString *)imageName andBorderWidth:(CGFloat)borderWidth andBorderColor:(UIColor *)borderColor{
    UIImage *oldImage = [UIImage imageNamed:imageName];
    UIGraphicsBeginImageContextWithOptions(oldImage.size, NO, 0.0);
    //获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //画da圆
    [borderColor set];
    CGFloat bigRadius = oldImage.size.width / 2;
    CGContextAddArc(ctx, bigRadius, bigRadius, bigRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx);
    //画小圆
    CGContextAddArc(ctx, bigRadius, bigRadius, bigRadius - 2 *borderWidth, 0, M_PI * 2, 0);
    CGContextClip(ctx);
    [oldImage drawInRect:CGRectMake(0, 0, oldImage.size.width, oldImage.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
+ (instancetype)captureWithView:(UIView *)view{
    UIGraphicsBeginImageContext(view.frame.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:ctx];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end
