//
//  UIView+ZZQExtension.h
//  PrKidsEnglish
//
//  Created by 郑志强 on 2017/3/26.
//  Copyright © 2017年 郑志强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ZZQExtension)

@property (nonatomic, assign) CGFloat zq_x;
@property (nonatomic, assign) CGFloat zq_y;
@property (assign, nonatomic) CGFloat zq_left;
@property (assign, nonatomic) CGFloat zq_right;
@property (assign, nonatomic) CGFloat zq_top;
@property (assign, nonatomic) CGFloat zq_bottom;
@property (assign, nonatomic) CGFloat zq_width;
@property (assign, nonatomic) CGFloat zq_height;
@property (assign, nonatomic) CGFloat zq_centerX;
@property (assign, nonatomic) CGFloat zq_centerY;
@property (assign, nonatomic) CGSize zq_size;
@property (assign, nonatomic) CGPoint zq_origin;


// 设置圆角 clip
- (void)rounded:(CGFloat)cornerRadius;

// 通过 maskLayer
- (void)maskLayerRounded:(CGFloat)cornerRadius;

// 给特定角设置圆角
- (void)maskLayerRounded:(CGFloat)cornerRadius rectCorners:(UIRectCorner)rectCorner;

// 设置圆角和边框
- (void)maskLayerRounded:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
// 设置圆角和边框
- (void)rounded:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;


// 设置边框
- (void)maskLayerBorder:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
// 设置边框
- (void)border:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;


// 设置圆角和阴影
- (void)rounded:(CGFloat)cornerRadius andShadowColor:(UIColor *)shadowColor opacity:(CGFloat)opacity radius:(CGFloat)radius offset:(CGSize)offset;

// 设置阴影
- (void)shadow:(UIColor *)shadowColor opacity:(CGFloat)opacity radius:(CGFloat)radius offset:(CGSize)offset;

- (void)addGradientColors:(NSArray <UIColor *> *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

@end


