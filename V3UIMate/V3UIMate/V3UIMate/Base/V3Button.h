//
//  V3Button.h
//  adeVital
//
//  Created by Vyacheslav Dubovitsky on 27.01.16.
//  Copyright © 2016 aipmedia. All rights reserved.
//

#import <UIKit/UIKit.h>

#if TARGET_INTERFACE_BUILDER
IB_DESIGNABLE
#endif

@interface V3Button : UIButton

@property (nonatomic) BOOL fontSizeIsRelativeToScreenWidth; // If enblaed font size will be relative to current screen width. Your font size value then should be specified for minimal phone or tablet resolution
@property (nonatomic) CGFloat letterSpacing; // Fast changer for the NSKernAttributeName attribute.

- (void)applyStyles; // Empty method where your styles should be defined.

@end
