//
//  UIView+ZZQExtension.m
//  PrKidsEnglish
//
//  Created by 郑志强 on 2017/3/26.
//  Copyright © 2017年 郑志强. All rights reserved.
//

#import "UIView+ZZQExtension.h"

@implementation UIView (ZZQExtension)

- (void)setZq_x:(CGFloat)zq_x {
    CGRect frame = self.frame;
    frame.origin.x = zq_x;
    self.frame = frame;
}


- (CGFloat)zq_x {
    return self.frame.origin.x;
}


- (void)setZq_y:(CGFloat)zq_y {
    CGRect frame = self.frame;
    frame.origin.y = zq_y;
    self.frame = frame;
}


- (CGFloat)zq_y {
    return self.frame.origin.y;
}


- (void)setZq_left:(CGFloat)zq_left {
    CGRect frame = self.frame;
    frame.origin.x = zq_left;
    self.frame = frame;
}


- (CGFloat)zq_left {
    return self.frame.origin.x;
}


- (void)setZq_right:(CGFloat)zq_right {
    CGRect frame = self.frame;
    frame.origin.x = zq_right - frame.size.width;
    self.frame = frame;
}


- (CGFloat)zq_right {
    return self.frame.origin.x + self.frame.size.width;
}


- (void)setZq_top:(CGFloat)zq_top {
    CGRect frame = self.frame;
    frame.origin.y = zq_top;
    self.frame = frame;
}


- (CGFloat)zq_top {
    return self.frame.origin.y;
}


- (void)setZq_bottom:(CGFloat)zq_bottom {
    CGRect frame = self.frame;
    frame.origin.y = zq_bottom - frame.size.height;
    self.frame = frame;
}


- (CGFloat)zq_bottom {
    return self.frame.origin.y + self.frame.size.height;
}


- (void)setZq_width:(CGFloat)zq_width {
    CGRect frame = self.frame;
    frame.size.width = zq_width;
    self.frame = frame;
}


- (CGFloat)zq_width {
    return self.frame.size.width;
}


- (void)setZq_height:(CGFloat)zq_height {
    CGRect frame = self.frame;
    frame.size.height = zq_height;
    self.frame = frame;
}


- (CGFloat)zq_height {
    return self.frame.size.height;
}


- (void)setZq_centerX:(CGFloat)zq_centerX {
    self.center = CGPointMake(zq_centerX, self.center.y);
}


- (CGFloat)zq_centerX {
    return self.center.x;
}


- (void)setZq_centerY:(CGFloat)zq_centerY {
    self.center = CGPointMake(self.center.x, zq_centerY);
}


- (CGFloat)zq_centerY {
    return self.center.y;
}


- (void)setZq_size:(CGSize)zq_size {
    CGRect frame = self.frame;
    frame.size = zq_size;
    self.frame = frame;
}


- (CGSize)zq_size {
    return self.frame.size;
}


- (void)setZq_origin:(CGPoint)zq_origin {
    CGRect frame = self.frame;
    frame.origin = zq_origin;
    self.frame = frame;
}


- (CGPoint)zq_origin {
    return CGPointMake(self.zq_x, self.zq_y);
}


#pragma mark - layer
- (void)rounded:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}


- (void)maskLayerRounded:(CGFloat)cornerRadius {
    [self maskLayerRounded:0 borderWidth:0.f borderColor:[UIColor clearColor]];
}


- (void)maskLayerRounded:(CGFloat)cornerRadius rectCorners:(UIRectCorner)rectCorner {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}


- (void)maskLayerRounded:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
   
    UIBezierPath* maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    
    CAShapeLayer* maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    
    if (borderWidth > 0) {

        UIBezierPath *borderPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
        
        CAShapeLayer *borderLayer = [CAShapeLayer layer];
        borderLayer.path = borderPath.CGPath;
        borderLayer.fillColor = [UIColor clearColor].CGColor;
        borderLayer.strokeColor = borderColor.CGColor;
        borderLayer.lineWidth = borderWidth * 2; // path在线的中间，mask会遮住一半，所以 *2
        borderLayer.frame = self.bounds;
        
        [self.layer addSublayer:borderLayer];
    }
}


- (void)rounded:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.masksToBounds = YES;
}


- (void)maskLayerBorder:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    [self maskLayerRounded:0 borderWidth:borderWidth borderColor:borderColor];
}


- (void)border:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    [self rounded:0 borderWidth:borderWidth borderColor:borderColor];
}


- (void)rounded:(CGFloat)cornerRadius andShadowColor:(UIColor *)shadowColor opacity:(CGFloat)opacity radius:(CGFloat)radius offset:(CGSize)offset {
    self.layer.cornerRadius = cornerRadius;
    [self shadow:shadowColor opacity:opacity radius:radius offset:offset];
}



- (void)shadow:(UIColor *)shadowColor opacity:(CGFloat)opacity radius:(CGFloat)radius offset:(CGSize)offset {
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowRadius = radius;
    self.layer.shadowOffset = offset;
}


- (void)addGradientColors:(NSArray *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    
    CAGradientLayer *gradientLayer = [CAGradientLayer new];
    
    NSMutableArray *cgColors = [NSMutableArray array];
    for (UIColor *color in colors) {
        [cgColors addObject:(__bridge id)color.CGColor];
    }
    gradientLayer.colors = cgColors;
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = endPoint;
    
    gradientLayer.frame = self.bounds;
    
    [self.layer addSublayer:gradientLayer];
}


- (void)converViewToDashedLineWithColor:(UIColor *)lineColor {
    [self convertViewToDashedLineWithLineLength:4 lineSpacing:2 lineColor:lineColor];
}


- (void)convertViewToDashedLineWithLineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor {
    
    CAShapeLayer *dottedLayer = [CAShapeLayer layer];
    [dottedLayer setFillColor:[UIColor clearColor].CGColor];
    [dottedLayer setStrokeColor:lineColor.CGColor];
    [dottedLayer setLineWidth:CGRectGetHeight(self.frame)];
    [dottedLayer setLineDashPattern:[NSArray arrayWithObjects:@(lineLength), @(lineSpacing), nil]];
    
    UIBezierPath *dottedPath = [UIBezierPath bezierPath];
    [dottedPath moveToPoint: CGPointMake(0, 0)];
    [dottedPath addLineToPoint:CGPointMake(CGRectGetWidth(self.frame), 0)];
    
    dottedLayer.path = dottedPath.CGPath;
    [self.layer addSublayer:dottedLayer];
}


@end


