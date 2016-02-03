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

- (void)applyStyles; // Empty method where your styles should be defined.

@end
