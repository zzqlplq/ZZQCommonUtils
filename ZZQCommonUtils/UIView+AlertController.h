//
//  UIView+AlertController.h
//  ZZQCommonUtils
//
//  Created by 郑志强 on 2018/11/6.
//  Copyright © 2018 郑志强. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AlertController <NSObject>

- (void)showAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message confirmHandler:(void(^)(UIAlertAction *confirmAction))handler;

- (void)showAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message confirmTitle:(NSString *)confirmTitle confirmHandler:(void(^)(UIAlertAction *confirmAction))handler;

- (void)showAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelAction:(nullable UIAlertAction *)cancelAction confirmAction:(nullable UIAlertAction *)confirmAction;

- (void)showSingleActionAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message actionTitle:(NSString *)actionTitle action:(void(^)(UIAlertAction *action))handler;

@end



@interface UIView (AlertController)<AlertController>

@end


@interface UIViewController (AlertController)<AlertController>

@end


NS_ASSUME_NONNULL_END
