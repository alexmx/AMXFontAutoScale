//
//  UILabel+AMXFontScale.h
//  AMXFontAutoScale
//
//  Created by Alexandru Maimescu on 3/15/17.
//  Copyright © 2017 Alex Maimescu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMXFontAutoScalable.h"

@interface UILabel (AMXFontScale) <AMXFontAutoScalable>

- (void)amx_autoScaleFontForReferenceScreenSize:(AMXScreenSize)screenSize;
+ (void)amx_autoScaleFontForReferenceScreenSize:(AMXScreenSize)screenSize;

@end
