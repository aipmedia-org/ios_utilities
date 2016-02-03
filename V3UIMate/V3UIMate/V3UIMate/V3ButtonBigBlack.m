//
//  V3ButtonBigBlack.m
//  V3UIMate
//
//  Created by Vyacheslav Dubovitsky on 03.02.16.
//  Copyright © 2016 Vyacheslav Dubovitsky. All rights reserved.
//

#import "V3ButtonBigBlack.h"

@implementation V3ButtonBigBlack

- (void)applyStyles
{
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    
    [self.titleLabel setFont:[UIFont systemFontOfSize:20 weight:UIFontWeightThin]];
    [self setBackgroundColor:[UIColor blackColor]];
    
    NSLog(@"%ld", (long)self.buttonType);
}

- (void)drawRect:(CGRect)rect
{
    [self drawCanvas1WithFrame:self.bounds isHighlighted:self.highlighted];
}

- (void)drawCanvas1WithFrame: (CGRect)frame isHighlighted: (BOOL)isHighlighted
{
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0.8 green: 0.32 blue: 0.32 alpha: 1];
    UIColor* color2 = [UIColor colorWithRed: 0.652 green: 0.8 blue: 0.32 alpha: 1];
    
    //// Variable Declarations
    UIColor* highlightColor = isHighlighted ? color : color2;
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), CGRectGetWidth(frame), CGRectGetHeight(frame))];
    [highlightColor setFill];
    [rectanglePath fill];
}

@end
