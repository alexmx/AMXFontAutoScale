//
//  UITextView+AMXFontScale.m
//  AMXFontAutoScale
//
//  Created by Alexandru Maimescu on 3/21/17.
//  Copyright © 2017 Alex Maimescu. All rights reserved.
//

#import "UITextView+AMXFontScale.h"
#import "NSObject+AMXFontScale.h"
#import "UIFont+AMXFontScale.h"

#import "FontUpdateBlockWrapper.h"

static AMXScreenSize s_globalReferenceScreenSize = AMXScreenSizeCurrent;
static BOOL s_globalAutoScaleEnabled = NO;

@implementation UITextView (AMXFontScale)

#pragma mark - Class API (Global)

+ (void)amx_autoScaleFontForReferenceScreenSize:(AMXScreenSize)screenSize
{
    [self set_amx_autoScaleEnabled:YES];
    [self set_amx_referenceScreenSize:screenSize];
}

+ (BOOL)amx_autoScaleEnabled
{
    return s_globalAutoScaleEnabled;
}

+ (void)set_amx_autoScaleEnabled:(BOOL)amx_autoScaleEnabled
{
    s_globalAutoScaleEnabled = amx_autoScaleEnabled;
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
    self.amx_autoScaleEnabled = YES;
    self.amx_referenceScreenSize = screenSize;
}

- (BOOL)amx_autoScaleEnabled
{
    return [[self amx_getObjectForKey:@selector(amx_autoScaleEnabled)] boolValue];
}

- (void)set_amx_autoScaleEnabled:(BOOL)amx_autoScaleEnabled
{
    [self amx_storeObject:@(amx_autoScaleEnabled) forKey:@selector(amx_autoScaleEnabled)];
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
    return [self amx_getObjectForKey:@selector(amx_autoScaleEnabled)] != nil;
}

- (AMXFontUpdateHandler)amx_fontSizeUpdateHandler
{
    FontUpdateBlockWrapper *wrapper = [self amx_getObjectForKey:@selector(amx_fontSizeUpdateHandler)];
    
    return wrapper.fontUpdateHandler;
}

- (void)set_amx_fontSizeUpdateHandler:(AMXFontUpdateHandler)amx_fontSizeUpdateHandler
{
    FontUpdateBlockWrapper *wrapper = [FontUpdateBlockWrapper new];
    wrapper.fontUpdateHandler = amx_fontSizeUpdateHandler;
    
    [self amx_storeObject:wrapper forKey:@selector(amx_fontSizeUpdateHandler)];
}

#pragma mark - Swizzles

+ (void)load
{
    [self amx_swizzleInstanceSelector:@selector(willMoveToWindow:)
                         withSelector:@selector(swizzle_willMoveToWindow:)];
}

- (void)swizzle_willMoveToWindow:(UIWindow *)newWindow
{
    if (newWindow) {
        AMXScreenSize referenceScreenSize = AMXScreenSizeCurrent;
        
        if (self.amx_autoScaleEnabled) {
            referenceScreenSize = self.amx_referenceScreenSize;
        } else if (self.class.amx_autoScaleEnabled && ![self wasInstanceAutoScaleSet]) {
            referenceScreenSize = self.class.amx_referenceScreenSize;
        }
        
        if (referenceScreenSize != AMXScreenSizeCurrent) {
            self.font = [self.font amx_scaleForReferenceScreenSize:referenceScreenSize
                                                     updateHandler:self.amx_fontSizeUpdateHandler];
        }
    }
    
    [self swizzle_willMoveToWindow:newWindow];
}

@end
