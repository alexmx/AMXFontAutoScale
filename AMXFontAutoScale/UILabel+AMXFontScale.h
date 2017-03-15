//
//  UILabel+AMXFontScale.h
//  AMXFontAutoScale
//
//  Created by Alexandru Maimescu on 3/15/17.
//  Copyright © 2017 Alex Maimescu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMXFontAutoScalable.h"

@interface UILabel (AMXFontScale)

@property (nonatomic, class, setter=set_amx_applyAutoFontScaleGlobally:) BOOL amx_applyAutoFontScaleGlobally;

- (void)amx_keepOriginalFontSizeForScreenSize:(AMXScreenSize)screenSize;

@end
