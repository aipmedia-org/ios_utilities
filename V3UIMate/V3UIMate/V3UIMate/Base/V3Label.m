//
//  V3Label.m
//  adeVital
//
//  Created by Vyacheslav Dubovitsky on 27.01.16.
//  Copyright © 2016 aipmedia. All rights reserved.
//

#import "V3Label.h"
#import "NSMutableAttributedString+V3LabelAdditions.h"

@implementation V3Label

- (void)realInit
{
    // Applying styles from subclass
    [self applyStyles];
    
    // Making Font Size relative to screen width if needed
    if (_fontSizeIsRelativeToScreenWidth) {
        self.attributedText = [NSMutableAttributedString attributedStringWithFontSizeRelativeToScreenWidthBasedOnAttributedString:self.attributedText];
    }
    
    // Setting the letter spacing if needed
    if (_letterSpacing != 0) {
        self.attributedText = [NSMutableAttributedString attributedStringWithLetterSpacingValue:_letterSpacing basedOnAttributedString:self.attributedText];
    }
}

// Public Method for Styles implementation in your Subclass
- (void)applyStyles
{
}

// Overriding the initializers
- (void)prepareForInterfaceBuilder
{
    [self realInit];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self realInit];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self realInit];
    }
    
    return self;
    
}


@end
