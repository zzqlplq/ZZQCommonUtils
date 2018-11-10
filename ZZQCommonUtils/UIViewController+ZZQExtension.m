//
//  UIViewController+ZZQExtension.m
//  ZZQCommonUtilDemo
//
//  Created by 郑志强 on 2018/11/10.
//  Copyright © 2018 郑志强. All rights reserved.
//

#import "UIViewController+ZZQExtension.h"

@implementation UIViewController (ZZQExtension)

- (UIImage *)snapshot {
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, [UIScreen mainScreen].scale);
    CGRect rect = self.view.bounds;
    [self.view drawViewHierarchyInRect:rect afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


- (void)forceTransferOrientation:(UIDeviceOrientation)orientation {
    
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val = orientation;
        // 从2开始是因为0 1 两个参数已经被selector和target占用
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];

        [[NSNotificationCenter defaultCenter] postNotificationName:UIDeviceOrientationDidChangeNotification object:nil];
    }
}


@end

@implementation UIViewController (ChildController)

- (void)addChildViewController:(UIViewController *)childController superview:(UIView *)superview {
    [self addChildViewController:childController];
    [superview addSubview:childController.view];
    [childController didMoveToParentViewController:self];
}


- (void)removeFromParentViewControllerAndSuperview {
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}


@end

