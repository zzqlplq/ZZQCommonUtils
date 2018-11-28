//
//  UIImage+ZZQExtension.m
//  ZZQCommonUtils
//
//  Created by 郑志强 on 2018/11/6.
//  Copyright © 2018 郑志强. All rights reserved.
//

#import "UIImage+ZZQExtension.h"

@implementation UIImage (ZZQExtension)

+ (UIImage *)imageWithFileName:(NSString *)name {
    
    NSArray *components = [name componentsSeparatedByString:@"."];
    NSString *type = components.count == 2 ? components.lastObject : @"png";
    return [self imageWithFileName:components.firstObject ofType:type];
}


+ (UIImage *)imageWithFileName:(NSString *)name ofType:(NSString *)type {
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:type];
    return [UIImage imageWithContentsOfFile:path];
}


- (UIImage *)rounded {
    CGFloat radius = MIN(self.size.height, self.size.width) / 2;
    return [self rounded:radius];
}


- (UIImage *)rounded:(CGFloat)radius {
    
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);

    CGContextRef context = UIGraphicsGetCurrentContext();

    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    CGContextAddPath(context,path.CGPath);
    CGContextClip(context);
    [self drawInRect:rect];
    
    CGContextDrawPath(context, kCGPathFillStroke);
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


- (UIImage *)imageWithScaledSize:(CGSize)size {
    
    CGRect rect = CGRectZero;
    rect.origin = CGPointZero;
    rect.size.width = size.width;
    rect.size.height = size.height;

    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [self drawInRect:rect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


@end


@implementation UIImage(UIColor)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    return [self imageWithColor:color size:size radius:0];
}


+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size radius:(CGFloat)radius {
    
    if (!color)  return nil;
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    
    // 需要切除的内容
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextAddPath(context,path.CGPath);
    // clip 多余部分
    CGContextClip(context);
    // 绘制路径
    CGContextDrawPath(context, kCGPathFillStroke);
    // 设置填充颜色
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 开始填充
    CGContextFillRect(context, rect);
    
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}



- (UIImage *)imageTintedWithColor:(UIColor *)color {
    
    if (!color) return self;
    
    CGRect imageRect = (CGRect){CGPointZero,self.size};
    UIGraphicsBeginImageContextWithOptions(imageRect.size, NO, self.scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextTranslateCTM(context, 0.0, -(imageRect.size.height));
    
    CGContextClipToMask(context, imageRect, self.CGImage);//选中选区 获取不透明区域路径
    CGContextSetFillColorWithColor(context, color.CGColor);//设置颜色
    CGContextFillRect(context, imageRect);//绘制
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();//提取图片
    UIGraphicsEndImageContext();

    return newImage;
}


@end
