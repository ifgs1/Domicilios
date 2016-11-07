//
//  
//  Domicilios
//
//  Created by Ivan F Garcia S on 11/7/16.
//  Copyright © 2016 Ivan F Garcia S. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor(HexString)

+ (UIColor *)colorWithHexString: (NSString *) hexString;
+ (UIColor *)colorWithHexString:(NSString *) hexString alpha:(CGFloat)alphaParam;
+ (CGFloat)colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length;
+ (UIColor *)colorUsingRed:(int)red green:(int)green blue:(int)blue alpha:(CGFloat)alpha;

@end
