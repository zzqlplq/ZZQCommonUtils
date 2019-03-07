//
//  NSString+ZZQExtension.m
//  ZZQCommonUtils
//
//  Created by 郑志强 on 2018/11/6.
//  Copyright © 2018 郑志强. All rights reserved.
//

#import "NSString+ZZQExtension.h"

@implementation NSString (ZZQExtension)

- (NSString *)addPrefix:(NSString *)prefix {
   
    if (self.length <1) {
        return prefix;
    }
    if (prefix.length < 1) {
        return self;
    }
    return [prefix stringByAppendingString:self];
}

- (NSString *)addSuffix:(NSString *)suffix {
    if (self.length < 1) {
        return suffix;
    }
    if (suffix.length < 1) {
        return self;
    }
    return [self stringByAppendingString:suffix];
}


@end


@implementation NSString (Size)

- (CGSize)getSizeWithFont:(UIFont *)font ofMaxSize:(CGSize)maxSize {
    NSDictionary *attribute = @{NSFontAttributeName:font};
    CGSize retSize = [self boundingRectWithSize:maxSize
                                        options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;
    return retSize;
}


- (CGFloat)getHeightWithFont:(UIFont *)font ofMaxSize:(CGSize)maxSize {
    CGSize size = [self getSizeWithFont:font ofMaxSize:maxSize];
    return size.height;
}


- (CGFloat)getWidthWithFont:(UIFont *)font ofMaxSize:(CGSize)maxSize {
    CGSize size = [self getSizeWithFont:font ofMaxSize:maxSize];
    return size.width;
}


- (CGFloat)getHeightWithSystemFontSize:(CGFloat)fontSize ofMaxSize:(CGSize)maxSize {
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    CGSize size = [self getSizeWithFont:font ofMaxSize:maxSize];
    return size.height;
}


- (CGFloat)getWidthWithSystemFontSize:(CGFloat)fontSize ofMaxSize:(CGSize)maxSize {
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    CGSize size = [self getSizeWithFont:font ofMaxSize:maxSize];
    return size.width;
}


@end
