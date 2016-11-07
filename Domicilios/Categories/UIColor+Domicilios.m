//
//  
//  Domicilios
//
//  Created by Ivan F Garcia S on 11/7/16.
//  Copyright © 2016 Ivan F Garcia S. All rights reserved.
//

#import "UIColor+Domicilios.h"
#import "UIColor+HexString.h"

@implementation UIColor (Domicilios)

+ (UIColor *)domiciliosRedColor
{
    return [UIColor colorWithHexString:@"D01D39"];
}


+(UIColor *)GrayText
{
    return [UIColor colorWithHexString:@"B4B5B4"];
}

+(UIColor *)GrayFill
{
    return [UIColor colorWithHexString:@"F2F1F1"];
}

+(UIColor *)Green
{
    return [UIColor colorWithHexString:@"509D49"];
}

+(UIColor *)LightGreen
{
    return [UIColor colorWithHexString:@"ABD19D"];
}

+(UIColor *)borderColor
{
    return [UIColor colorWithHexString:@"DAD9D9"];
}
+(UIColor *)CellTextColor
{
    return [UIColor colorWithHexString:@"675C53"];
}
@end
