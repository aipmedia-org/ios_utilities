//
//  V3Label.h
//  adeVital
//
//  Created by Vyacheslav Dubovitsky on 27.01.16.
//  Copyright © 2016 aipmedia. All rights reserved.
//

#import <UIKit/UIKit.h>

#if TARGET_INTERFACE_BUILDER
IB_DESIGNABLE
#endif

@interface V3Label : UILabel

/* Notice that all of the properties below interact with *attributedText of your label. You can setup your label with *font, *color and other simple properties only via overriding the -(void)applyStyles method in your subclass */

@property (nonatomic) IBInspectable BOOL fontSizeIsRelativeToScreenWidth; // If enblaed font size will be relative to current screen width. Your font size value then should be specified for minimal phone or tablet resolution
@property (nonatomic) IBInspectable CGFloat letterSpacing; // Fast changer for the NSKernAttributeName attribute.

- (void)applyStyles; // Empty method where your styles should be defined.

@end
