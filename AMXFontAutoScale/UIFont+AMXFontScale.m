//
//  UIFont+AMXFontScale.m
//  AMXFontAutoScale
//
//  Created by Alexandru Maimescu on 3/15/17.
//  Copyright © 2017 Alex Maimescu. All rights reserved.
//

#import "UIFont+AMXFontScale.h"
#import "NSObject+AMXFontScale.h"

@implementation UIFont (AMXFontScale)

+ (instancetype)amx_fontWithDescriptor:(UIFontDescriptor *)descriptor
                                  size:(CGFloat)pointSize
                          originalSize:(CGFloat)originalPointSize
{
    UIFont *font = [UIFont fontWithDescriptor:descriptor size:pointSize];
    font.amx_originalFontPointSize = originalPointSize;
    
    return font;
}

- (instancetype)amx_scaleForReferenceScreenSize:(AMXScreenSize)screenSize
                                  updateHandler:(AMXFontUpdateHandler)updateHandler
{
    CGFloat multiplier = [self amx_fontPointSizeMultiplierForReferenceScreenSize:screenSize];
    UIFont *finalFont = self;
    
    if (multiplier != 1) {
        CGFloat finalSize = self.amx_originalFontPointSize * multiplier;
        finalFont = [UIFont amx_fontWithDescriptor:self.fontDescriptor
                                              size:finalSize
                                      originalSize:self.amx_originalFontPointSize];
        
        if (updateHandler) {
            updateHandler(self.amx_originalFontPointSize, finalSize, multiplier);
        }
    }
    
    return finalFont;
}

- (CGFloat)amx_fontPointSizeMultiplierForReferenceScreenSize:(AMXScreenSize)screenSize
{
    return [self amx_currentScreenWidth] / [self amx_screenWidthForScreenSize:screenSize];
}

- (CGFloat)amx_screenWidthForScreenSize:(AMXScreenSize)screenSize
{
    switch (screenSize) {
        case AMXScreenSize3p5Inch:
        case AMXScreenSize4Inch:
            return 320;
        case AMXScreenSize4p7Inch:
            return 375;
        case AMXScreenSize5p5Inch:
            return 414;
        case AMXScreenSize7p9Inch:
        case AMXScreenSize9p7Inch:
            return 768;
        case AMXScreenSize12p9Inch:
            return 1024;
        case AMXScreenSizeCurrent:
        default:
            break;
    }
    
    return [self amx_currentScreenWidth];
}

- (void)set_amx_originalFontPointSize:(CGFloat)size
{
    [self amx_storeObject:@(size) forKey:@selector(amx_originalFontPointSize)];
}

- (CGFloat)amx_originalFontPointSize
{
    CGFloat originalFontSize = [[self amx_getObjectForKey:@selector(amx_originalFontPointSize)] floatValue];
    
    if (!originalFontSize) {
        originalFontSize = self.pointSize;
    }
    
    return originalFontSize;
}

- (CGFloat)amx_currentScreenWidth
{
    return CGRectGetWidth([[UIScreen mainScreen] bounds]);
}

@end
