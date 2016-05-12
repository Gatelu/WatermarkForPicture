//
//  UIImage+lcx.h
//  水印
//
//  Created by Gate on 16/1/2.
//  Copyright © 2016年 Gate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (lcx)
//水印
+ (UIImage *)waterImageWithBg:(NSString *)Bgimage andWater:(NSString *)logo andTitle:(NSString *)title;
//裁剪图片
+ (instancetype)circleImageWithImageName:(NSString *)imageName andBorderWidth:(CGFloat)borderWidth andBorderColor:(UIColor *)borderColor;
//截图
+ (instancetype)captureWithView:(UIView *)view;
@end
