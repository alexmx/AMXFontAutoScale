//
//  UITextView+AMXFontScale.h
//  AMXFontAutoScale
//
//  Created by Alexandru Maimescu on 3/21/17.
//  Copyright © 2017 Alex Maimescu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMXFontAutoScalable.h"

@interface UITextView (AMXFontScale) <AMXFontAutoScalable>

- (void)amx_autoScaleFontForReferenceScreenSize:(AMXScreenSize)screenSize;
+ (void)amx_autoScaleFontForReferenceScreenSize:(AMXScreenSize)screenSize;

@end
