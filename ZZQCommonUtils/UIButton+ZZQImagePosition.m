//
//  UIButton+ZZQImagePosition.m
//  ZZQCommonUtils
//
//  Created by 郑志强 on 2018/11/6.
//  Copyright © 2018 郑志强. All rights reserved.
//

#import "UIButton+ZZQImagePosition.h"

@implementation UIButton (ZZQImagePosition)

- (void)setImagePosition:(ZZQImagePosition)postion spacing:(CGFloat)spacing {
    
    CGFloat imageWidth = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
    
    CGFloat titleWidth = self.titleLabel.intrinsicContentSize.width;
    CGFloat titleHeight = self.titleLabel.intrinsicContentSize.height;
    
    switch (postion) {
        case ZZQImagePositionLeft: {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, - 0.5 * spacing, 0, 0.5 * spacing);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, 0.5 * spacing, 0, - 0.5 * spacing);
        }
            break;

        case ZZQImagePositionRight: {
            CGFloat imageOffset = titleWidth + 0.5 * spacing;
            CGFloat titleOffset = imageWidth + 0.5 * spacing;
            self.imageEdgeInsets = UIEdgeInsetsMake(0, imageOffset + 0.5 * spacing, 0, -imageOffset);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, - titleOffset, 0, titleOffset);
        }
            break;
            
        case ZZQImagePositionTop: {
            self.imageEdgeInsets = UIEdgeInsetsMake(- titleHeight - spacing, 0, 0, - titleWidth);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageWidth, - imageHeight - spacing, 0);
        }
            break;
            
        case ZZQImagePositionBottom: {
            self.imageEdgeInsets = UIEdgeInsetsMake(titleHeight + spacing, 0, 0, - titleWidth);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageWidth, imageHeight + spacing, 0);
        }
            break;
    }
}


@end
