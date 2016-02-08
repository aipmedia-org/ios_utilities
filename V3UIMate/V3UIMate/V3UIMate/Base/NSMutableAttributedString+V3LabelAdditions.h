//
//  NSMutableAttributedString+V3LabelAdditions.h
//  V3UIMate
//
//  Created by Vyacheslav Dubovitsky on 04.02.16.
//  Copyright © 2016 Vyacheslav Dubovitsky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (V3LabelAdditions)

+ (NSMutableAttributedString *)attributedStringWithFontSizeRelativeToScreenWidthBasedOnAttributedString:(NSAttributedString *)attributedString; /* Returns an Attributed String with font size relative to current screen width. Notice that original font size value should be specified for 320pt width of Phone screen and 768pt width of iPad screen  */
+ (NSMutableAttributedString *)attributedStringWithLetterSpacingValue:(CGFloat)letterSpacingvalue basedOnAttributedString:(NSAttributedString *)attributedString; // Returns an Attributed String with setted Letter Spacing value

@end
