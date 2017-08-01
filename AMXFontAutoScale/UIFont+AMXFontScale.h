//
//  UIFont+AMXFontScale.h
//  AMXFontAutoScale
//
//  Created by Alexandru Maimescu on 3/15/17.
//  Copyright © 2017 Alex Maimescu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMXFontAutoScalable.h"

@interface UIFont (AMXFontScale)

@property (nonatomic, assign, setter=set_amx_originalFontPointSize:) CGFloat amx_originalFontPointSize;

+ (instancetype)amx_fontWithDescriptor:(UIFontDescriptor *)descriptor
                                  size:(CGFloat)pointSize
                          originalSize:(CGFloat)originalPointSize;

- (instancetype)amx_scaleForReferenceScreenSize:(AMXScreenSize)screenSize
                                  updateHandler:(AMXFontUpdateHandler)updateHandler;

- (CGFloat)amx_fontPointSizeMultiplierForReferenceScreenSize:(AMXScreenSize)screenSize;

@end
