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
        NSInteger val = orientation;
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


@implementation UIViewController (Transtion)

- (void)transitionFromRight:(BOOL)fromRight withFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options completion:(void (^__nullable)(BOOL))completion {
    
    CGRect originRect = fromVC.view.frame;
    CGRect nowRect = CGRectMake(originRect.origin.x, toVC.view.frame.origin.y, toVC.view.frame.size.width, toVC.view.frame.size.height);

    CGRect leftRect = CGRectMake(nowRect.origin.x-nowRect.size.width, nowRect.origin.y, nowRect.size.width, nowRect.size.height);
    CGRect rightRect = CGRectMake(nowRect.origin.x+nowRect.size.width, nowRect.origin.y, nowRect.size.width, nowRect.size.height);

    CGRect newStartRect;
    CGRect oldEndRect;
    
    if (fromRight) {
        newStartRect = rightRect;
        oldEndRect = leftRect;
    } else {
        newStartRect = leftRect;
        oldEndRect = rightRect;
    }
    
    oldEndRect = CGRectMake(oldEndRect.origin.x, originRect.origin.y, originRect.size.width, originRect.size.height);
    toVC.view.frame = newStartRect;

    [self transitionFromViewController:fromVC toViewController:toVC duration:duration options:options animations:^{
        toVC.view.frame = nowRect;
        fromVC.view.frame = oldEndRect;
    } completion:^(BOOL finished) {
        completion ? completion(finished) : nil;
    }];
}


- (void)transitionFromRight:(BOOL)fromRight withFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC duration:(NSTimeInterval)duration completion:(void (^__nullable)(BOOL finished))completion {
   
    [self transitionFromRight:fromRight withFromViewController:fromVC toViewController:toVC duration:duration options:UIViewAnimationOptionTransitionNone completion:completion];
}

@end
