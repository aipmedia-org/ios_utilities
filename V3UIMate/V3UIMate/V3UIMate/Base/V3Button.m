//
//  V3Button.m
//  adeVital
//
//  Created by Vyacheslav Dubovitsky on 27.01.16.
//  Copyright © 2016 aipmedia. All rights reserved.
//

#import "V3Button.h"
#import "V3Label.h"

@implementation V3Button

- (void)layoutSubviews
{
    [self applyStyles];
}

// Public Method for Styles implementation in your Subclass
- (void)applyStyles
{
}

// Overriding the initializers
- (void)prepareForInterfaceBuilder
{
    [self applyStyles];
}

@end
