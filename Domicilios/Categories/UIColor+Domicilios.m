//
//  UIColor+Azteca.m
//  Azteca
//
//  Created by Alejandro Fernandez on 7/11/16.
//  Copyright © 2016 YellowPepper. All rights reserved.
//

#import "UIColor+Azteca.h"
#import "UIColor+HexString.h"

@implementation UIColor (Domicilios)

+ (UIColor *)aztecaEvenDarkGrayText
{
    return [UIColor colorWithHexString:@"707273"];
}

+(UIColor *)aztecaDarkGrayText
{
    return [UIColor grayColor];
}

+(UIColor *)aztecaGrayText
{
    return [UIColor colorWithHexString:@"B4B5B4"];
}

+(UIColor *)aztecaGrayFill
{
    return [UIColor colorWithHexString:@"F2F1F1"];
}

+(UIColor *)aztecaGreen
{
    return [UIColor colorWithHexString:@"509D49"];
}

+(UIColor *)aztecaLightGreen
{
    return [UIColor colorWithHexString:@"ABD19D"];
}

+(UIColor *)borderColor
{
    return [UIColor colorWithHexString:@"DAD9D9"];
}
+(UIColor *)aztecaCellTextColor
{
    return [UIColor colorWithHexString:@"675C53"];
}
@end
