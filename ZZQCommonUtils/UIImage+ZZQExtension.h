//
//  UIImage+ZZQExtension.h
//  ZZQCommonUtils
//
//  Created by 郑志强 on 2018/11/6.
//  Copyright © 2018 郑志强. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ZZQExtension)

+ (UIImage *)imageWithFileName:(NSString *)name;

+ (UIImage *)imageWithFileName:(NSString *)name ofType:(NSString *)type;

- (UIImage *)rounded:(CGFloat)radius;

// 按比例缩放
- (UIImage *)imageWithScaledSize:(CGSize)size;

@end


@interface UIImage (UIColor)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size radius:(CGFloat)radius;

- (UIImage *)imageTintedWithColor:(UIColor *)color;

@end



NS_ASSUME_NONNULL_END
