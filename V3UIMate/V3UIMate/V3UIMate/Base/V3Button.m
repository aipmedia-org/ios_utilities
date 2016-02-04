//
//  V3Button.m
//  adeVital
//
//  Created by Vyacheslav Dubovitsky on 27.01.16.
//  Copyright © 2016 aipmedia. All rights reserved.
//

#import "V3Button.h"
#import "NSMutableAttributedString+V3LabelAdditions.h"

@implementation V3Button

- (void)realInit
{
    // Throwing an exception if buttonType is not UIButtonTypeCustom
    if (self.buttonType != 0) {
        NSException *wrongButtonTypeException = [NSException
                                                 exceptionWithName:@"WrongButtonTypeException"
                                                 reason:@"V3Button only supports UIButtonTypeCustom as button type. Please make sure you chose the right Button Type in Storyboard Attributes Inspector or used right UIButtonType during button initialisation in code"
                                                 userInfo:nil];
        @throw wrongButtonTypeException;
    }
    
    // Applying styles from subclass
    [self applyStyles];
    
    // Making Font Size relative to screen width if needed
    if (_fontSizeIsRelativeToScreenWidth) {
        [self setAttributedTitle:[NSMutableAttributedString attributedStringWithFontSizeRelativeToScreenWidthBasedOnAttributedString:self.currentAttributedTitle] forState:UIControlStateNormal];
    }
    
    // Setting the letter spacing if needed
    if (_letterSpacing != 0) {
        [self setAttributedTitle:[NSMutableAttributedString attributedStringWithLetterSpacingValue:_letterSpacing basedOnAttributedString:self.currentAttributedTitle] forState:UIControlStateNormal];
    }
    
}

// Public Method for Styles implementation in your Subclass
- (void)applyStyles
{
}

// Calling drawRect when button states changes for PaintCode drawings support
- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self setNeedsDisplay];
    
    // Animating the state changes
    [UIView transitionWithView:self
                      duration:0.175
                       options:UIViewAnimationOptionTransitionCrossDissolve
                     animations:^{
                        [self.layer displayIfNeeded];
                    }
                    completion:nil];
}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    [self setNeedsDisplay];

    [UIView transitionWithView:self
                      duration:0.175
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        [self.layer displayIfNeeded];
                    }
                    completion:nil];
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    [self setNeedsDisplay];
    
    [UIView transitionWithView:self
                      duration:0.175
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        [self.layer displayIfNeeded];
                    }
                    completion:nil];
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
