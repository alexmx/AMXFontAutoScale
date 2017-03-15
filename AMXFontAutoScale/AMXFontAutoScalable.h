//
//  AMXFontAutoScalable.h
//  AMXFontAutoScale
//
//  Created by Alexandru Maimescu on 3/15/17.
//  Copyright © 2017 Alex Maimescu. All rights reserved.
//

#ifndef AMXFontAutoScalable_h
#define AMXFontAutoScalable_h

typedef NS_ENUM(NSInteger, AMXScreenSize) {
    AMXScreenSize_3_5,
    AMXScreenSize_4,
    AMXScreenSize_4_7,
    AMXScreenSize_5_5,
    AMXScreenSize_7_9,
    AMXScreenSize_9_7,
    AMXScreenSize_12_9,
    AMXScreenSizeCurrent
};

@protocol AMXFontAutoScalable <NSObject>

- (void)amx_keepOriginalFontSizeForScreenSize:(AMXScreenSize)screenSize;

@end

#endif /* AMXFontAutoScalable_h */
