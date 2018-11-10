//
//  UIViewController+ZZQExtension.h
//  ZZQCommonUtilDemo
//
//  Created by 郑志强 on 2018/11/10.
//  Copyright © 2018 郑志强. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (ZZQExtension)

- (UIImage *)snapshot;

- (void)forceTransferOrientation:(UIDeviceOrientation)orientation;

@end


@interface UIViewController (ChildController)

- (void)addChildViewController:(UIViewController *)childController superview:(UIView *)superview;

- (void)removeFromParentViewControllerAndSuperview;

@end


NS_ASSUME_NONNULL_END
