//
//  UIButton+ZZQImagePosition.h
//  ZZQCommonUtils
//
//  Created by 郑志强 on 2018/11/6.
//  Copyright © 2018 郑志强. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ZZQImagePosition) {
    ZZQImagePositionLeft   = 1,   // 图片左，文字右  默认
    ZZQImagePositionRight,         // 图片右，文字左
    ZZQImagePositionTop,            // 图片上，文字下
    ZZQImagePositionBottom       // 图片下，文字上
};



@interface UIButton (ZZQImagePosition)

- (void)setImagePosition:(ZZQImagePosition)postion spacing:(CGFloat)spacing;

@end

NS_ASSUME_NONNULL_END
