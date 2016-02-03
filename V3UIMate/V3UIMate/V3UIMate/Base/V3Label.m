//
//  V3Label.m
//  adeVital
//
//  Created by Vyacheslav Dubovitsky on 27.01.16.
//  Copyright © 2016 aipmedia. All rights reserved.
//

#import "V3Label.h"

@implementation V3Label

// Update these constaints when the default minimal width of devices changes
CGFloat const phoneMinimalScreenWidth = 320;
CGFloat const padMinimalScreenWidth = 768;

- (void)realInit
{
    [self applyStyles];
    
    if (_fontSizeIsRelativeToScreenWidth) {
        self.attributedText = [self attributedStringWithFontSizeRelativeToScreenWidthBasedOnAttributedString:self.attributedText];
    }

    if (_letterSpacing != 0) {
        self.attributedText = [self attributedStringWithLetterSpacingValue:_letterSpacing basedOnAttributedString:self.attributedText];
    }
}

- (NSAttributedString *)attributedStringWithFontSizeRelativeToScreenWidthBasedOnAttributedString:(NSAttributedString *)attributedString
{
    // Detecting which side of screen is width in portrait orientation
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat currentScreenWidth = screenBounds.size.width >= screenBounds.size.height ? screenBounds.size.width : screenBounds.size.height;
    
    // Setting the default values of screen width based on device type
    CGFloat minimalScreenWidth;
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        minimalScreenWidth = phoneMinimalScreenWidth;
    } else {
        minimalScreenWidth = padMinimalScreenWidth;
    }
    
    // Updating font size of the input *attributedString
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:attributedString];
    [mutableAttributedString beginEditing];
    [mutableAttributedString enumerateAttribute:NSFontAttributeName inRange:NSMakeRange(0, mutableAttributedString.length) options:0 usingBlock:^(id value, NSRange range, BOOL *stop) {
        
        UIFont* font = value;
        // Calculating the relative font size value and applying it
        CGFloat relativeFontSize = font.pointSize / minimalScreenWidth * currentScreenWidth;
        font = [font fontWithSize:relativeFontSize];
        
        [mutableAttributedString removeAttribute:NSFontAttributeName range:range];
        [mutableAttributedString addAttribute:NSFontAttributeName value:font range:range];
    }];
    [mutableAttributedString endEditing];
    
    return [mutableAttributedString copy];
}

- (NSAttributedString *)attributedStringWithLetterSpacingValue:(CGFloat)letterSpacingvalue basedOnAttributedString:(NSAttributedString *)attributedString
{
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:attributedString];
    
    [mutableAttributedString addAttribute:NSKernAttributeName
                             value:@(letterSpacingvalue)
                             range:NSMakeRange(0, attributedString.length)];
    
    return [mutableAttributedString copy];
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
