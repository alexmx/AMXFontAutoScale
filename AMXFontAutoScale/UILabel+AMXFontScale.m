//
//  UILabel+AMXFontScale.m
//  AMXFontAutoScale
//
//  Created by Alexandru Maimescu on 3/15/17.
//  Copyright © 2017 Alex Maimescu. All rights reserved.
//

#import "UILabel+AMXFontScale.h"
#import "NSObject+AMXFontScale.h"
#import "UIFont+AMXFontScale.h"

static AMXScreenSize s_globalReferenceScreenSize = AMXScreenSizeCurrent;
static BOOL s_globalAutoScaleEnabled = NO;

@implementation UILabel (AMXFontScale)

#pragma mark - Class API (Global)

+ (void)amx_autoScaleFontForReferenceScreenSize:(AMXScreenSize)screenSize
{
    [self set_amx_autoScaleEndabled:YES];
    [self set_amx_referenceScreenSize:screenSize];
}

+ (BOOL)amx_autoScaleEndabled
{
    return s_globalAutoScaleEnabled;
}

+ (void)set_amx_autoScaleEndabled:(BOOL)amx_autoScaleEndabled
{
    s_globalAutoScaleEnabled = amx_autoScaleEndabled;
}

+ (AMXScreenSize)amx_referenceScreenSize
{
    return s_globalReferenceScreenSize;
}

+ (void)set_amx_referenceScreenSize:(AMXScreenSize)amx_referenceScreenSize
{
    s_globalReferenceScreenSize = amx_referenceScreenSize;
}

#pragma mark - Instance API

- (void)amx_autoScaleFontForReferenceScreenSize:(AMXScreenSize)screenSize
{
    self.amx_autoScaleEndabled = YES;
    self.amx_referenceScreenSize = screenSize;
}

- (BOOL)amx_autoScaleEndabled
{
    return [[self amx_getObjectForKey:@selector(amx_autoScaleEndabled)] boolValue];
}

- (void)set_amx_autoScaleEndabled:(BOOL)amx_autoScaleEndabled
{
    [self amx_storeObject:@(amx_autoScaleEndabled) forKey:@selector(amx_autoScaleEndabled)];
}

- (AMXScreenSize)amx_referenceScreenSize
{
    return [[self amx_getObjectForKey:@selector(amx_referenceScreenSize)] integerValue];
}

- (void)set_amx_referenceScreenSize:(AMXScreenSize)amx_referenceScreenSize
{
    [self amx_storeObject:@(amx_referenceScreenSize) forKey:@selector(amx_referenceScreenSize)];
}

- (BOOL)wasInstanceAutoScaleSet
{
    return [self amx_getObjectForKey:@selector(amx_autoScaleEndabled)] != nil;
}

#pragma mark - Swizzles

+ (void)load
{
    [self amx_swizzleInstanceSelector:@selector(willMoveToWindow:)
                         withSelector:@selector(swizzle_willMoveToWindow:)];
}

- (void)swizzle_willMoveToWindow:(UIWindow *)newWindow
{
    AMXScreenSize referenceScreenSize = AMXScreenSizeCurrent;
    if (self.amx_autoScaleEndabled) {
        referenceScreenSize = self.amx_referenceScreenSize;
    } else if (self.class.amx_autoScaleEndabled && ![self wasInstanceAutoScaleSet]) {
        referenceScreenSize = self.class.amx_referenceScreenSize;
    }
    
    if ([self.font amx_fontPointSizeMultiplierForReferenceScreenSize:referenceScreenSize] != 1) {
        self.font = [self.font amx_scaleForReferenceScreenSize:referenceScreenSize];
    }
    
    [self swizzle_willMoveToWindow:newWindow];
}

@end
