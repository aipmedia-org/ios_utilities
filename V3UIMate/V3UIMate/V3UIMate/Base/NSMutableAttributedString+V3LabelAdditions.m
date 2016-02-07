//
//  NSMutableAttributedString+V3LabelAdditions.m
//  V3UIMate
//
//  Created by Vyacheslav Dubovitsky on 04.02.16.
//  Copyright © 2016 Vyacheslav Dubovitsky. All rights reserved.
//

#import "NSMutableAttributedString+V3LabelAdditions.h"

@implementation NSMutableAttributedString (V3LabelAdditions)

+ (NSMutableAttributedString *)attributedStringWithFontSizeRelativeToScreenWidthBasedOnAttributedString:(NSAttributedString *)attributedString
{
    // Update these values when the default minimal width of devices changes. Don't forget also to update the comment in header file here with current values
    CGFloat phoneMinimalScreenWidth = 320;
    CGFloat padMinimalScreenWidth = 768;
    
    // Detecting which side of screen is width in portrait orientation
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat currentScreenWidth = screenBounds.size.width <= screenBounds.size.height ? screenBounds.size.width : screenBounds.size.height;
    
    // Setting the default values of screen width based on device type
    CGFloat minimalScreenWidth;
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        minimalScreenWidth = phoneMinimalScreenWidth;
    } else {
        minimalScreenWidth = padMinimalScreenWidth;
    }
    
    // Small hack to get an accurate font size values in Storyboard preview
    #if TARGET_INTERFACE_BUILDER
        minimalScreenWidth = 320;
    #endif
    
    // Updating font size of the input *attributedString
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:attributedString];
    [mutableAttributedString beginEditing];
    [mutableAttributedString enumerateAttribute:NSFontAttributeName inRange:NSMakeRange(0, mutableAttributedString.length) options:0 usingBlock:^(id value, NSRange range, BOOL *stop) {
        UIFont* font = value;
        // Calculating the relative font size value and applying it
        CGFloat relativeFontSize = font.pointSize + (currentScreenWidth - minimalScreenWidth) / 47;
        NSString *fontName = font.fontName;
        font = [UIFont fontWithName:fontName size:relativeFontSize];
        [mutableAttributedString removeAttribute:NSFontAttributeName range:range];
        [mutableAttributedString addAttribute:NSFontAttributeName value:font range:range];
    }];
    [mutableAttributedString endEditing];
    
    return mutableAttributedString;
}

+ (NSMutableAttributedString *)attributedStringWithLetterSpacingValue:(CGFloat)letterSpacingvalue basedOnAttributedString:(NSAttributedString *)attributedString
{
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:attributedString];
    [mutableAttributedString beginEditing];
    [mutableAttributedString removeAttribute:NSKernAttributeName range:NSMakeRange(0, mutableAttributedString.length)];
    [mutableAttributedString addAttribute:NSKernAttributeName
                                    value:@(letterSpacingvalue)
                                    range:NSMakeRange(0, attributedString.length)
     ];
    [mutableAttributedString endEditing];
    return mutableAttributedString;
}

- (void)prepareForInterfaceBuilder
{
    
}

@end
