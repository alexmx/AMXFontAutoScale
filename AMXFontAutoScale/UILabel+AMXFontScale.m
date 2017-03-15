//
//  UILabel+AMXFontScale.m
//  AMXFontAutoScale
//
//  Created by Alexandru Maimescu on 3/15/17.
//  Copyright © 2017 Alex Maimescu. All rights reserved.
//

#import "UILabel+AMXFontScale.h"
#import "NSObject+AMXFontScale.h"

static BOOL s_ApplyFontScaleGlobally = NO;

@implementation UILabel (AMXFontScale)

+ (BOOL)amx_applyAutoFontScaleGlobally
{
    return s_ApplyFontScaleGlobally;
}

+ (void)set_amx_applyAutoFontScaleGlobally:(BOOL)applyGlobally
{
    s_ApplyFontScaleGlobally = applyGlobally;
}

- (void)amx_keepOriginalFontSizeForScreenSize:(AMXScreenSize)screenSize
{
    
}

#pragma mark - Swizzles

+ (void)load
{
    [self amx_swizzleInstanceSelector:@selector(layoutSubviews)
                         withSelector:@selector(swizzle_layoutSubviews)];
}

- (void)swizzle_layoutSubviews
{
    
}

@end
