//
//  UIView+AlertController.m
//  ZZQCommonUtils
//
//  Created by 郑志强 on 2018/11/6.
//  Copyright © 2018 郑志强. All rights reserved.
//

#import "UIView+AlertController.h"

@implementation UIView (AlertController)

- (void)showAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message confirmHandler:(void (^)(UIAlertAction * _Nonnull))handler {
    
    [self showAlertWithTitle:title message:message confirmTitle:@"确定" confirmHandler:handler];
}

- (void)showAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message confirmTitle:(NSString *)confirmTitle confirmHandler:(void (^)(UIAlertAction * _Nonnull))handler {
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDefault handler:handler];
    [self showAlertWithTitle:title message:message cancelAction:cancelAction confirmAction:confirmAction];
}


- (void)showAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelAction:(nullable UIAlertAction *)cancelAction confirmAction:(nullable UIAlertAction *)confirmAction {
    
    if (cancelAction == nil && confirmAction == nil) {
        return;
    }
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    cancelAction != nil ? [alertController addAction:cancelAction] : nil;
    confirmAction != nil ? [alertController addAction:confirmAction] : nil;
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}

- (void)showSingleActionAlertWithTitle:(NSString *)title message:(NSString *)message actionTitle:(NSString *)actionTitle action:(void (^)(UIAlertAction * _Nonnull))handler {
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:handler];
    [self showAlertWithTitle:title message:message cancelAction:nil confirmAction:action];
}


@end


@implementation UIViewController (AlertController)

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message confirmHandler:(void (^)(UIAlertAction * _Nonnull))handler {
   
    [self.view showAlertWithTitle:title message:message confirmHandler:handler];
}

- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle confirmHandler:(void (^)(UIAlertAction * _Nonnull))handler {
    
    [self.view showAlertWithTitle:title message:message confirmTitle:confirmTitle confirmHandler:handler];
}


- (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelAction:(UIAlertAction *)cancelAction confirmAction:(UIAlertAction *)confirmAction {

    [self.view showAlertWithTitle:title message:message cancelAction:cancelAction confirmAction:confirmAction];
}

- (void)showSingleActionAlertWithTitle:(nullable NSString *)title message:(nullable NSString *)message actionTitle:(nonnull NSString *)actionTitle action:(nonnull void (^)(UIAlertAction * _Nonnull))handler {
    
    [self.view showSingleActionAlertWithTitle:title message:message actionTitle:actionTitle action:handler];
}



@end
