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

- (void)realInit
{
    [self applyStyles];
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

// Forced setting the button type to Custom
- (UIButtonType)buttonType
{
    return UIButtonTypeCustom;
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
