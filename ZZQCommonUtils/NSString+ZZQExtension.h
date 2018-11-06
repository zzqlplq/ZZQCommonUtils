//
//  NSString+ZZQExtension.h
//  ZZQCommonUtils
//
//  Created by 郑志强 on 2018/11/6.
//  Copyright © 2018 郑志强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ZZQExtension)

- (NSString *)addPrefix:(NSString *)prefix;


@end




@interface NSString (Size)

- (CGFloat)getHeightWithFont:(UIFont *)font ofMaxSize:(CGSize)maxSize;
- (CGFloat)getWidthWithFont:(UIFont *)font ofMaxSize:(CGSize)maxSize;

- (CGFloat)getHeightWithSystemFontSize:(CGFloat)fontSize ofMaxSize:(CGSize)maxSize;
- (CGFloat)getWidthWithSystemFontSize:(CGFloat)fontSize ofMaxSize:(CGSize)maxSize;

@end



NS_ASSUME_NONNULL_END
