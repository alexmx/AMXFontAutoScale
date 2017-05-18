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
    AMXScreenSizeCurrent,
    AMXScreenSize3p5Inch,
    AMXScreenSize4Inch,
    AMXScreenSize4p7Inch,
    AMXScreenSize5p5Inch,
    AMXScreenSize7p9Inch,
    AMXScreenSize9p7Inch,
    AMXScreenSize12p9Inch
};

@protocol AMXFontAutoScalable <NSObject>

@property (nonatomic, class, setter=set_amx_autoScaleEnabled:) BOOL amx_autoScaleEnabled;
@property (nonatomic, assign, setter=set_amx_autoScaleEnabled:) BOOL amx_autoScaleEnabled;

@property (nonatomic, assign, setter=set_amx_referenceScreenSize:) AMXScreenSize amx_referenceScreenSize;
@property (nonatomic, class, setter=set_amx_referenceScreenSize:) AMXScreenSize amx_referenceScreenSize;

+ (void)amx_autoScaleFontForReferenceScreenSize:(AMXScreenSize)screenSize;
- (void)amx_autoScaleFontForReferenceScreenSize:(AMXScreenSize)screenSize;

@end

#endif /* AMXFontAutoScalable_h */
