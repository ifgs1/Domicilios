//
//  
//  Domicilios
//
//  Created by Ivan F Garcia S on 11/7/16.
//  Copyright © 2016 Ivan F Garcia S. All rights reserved.
//
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, YPNetworkErrorCodes) {
    YPNetworkNoInternetConnectionCode = -1,
    YPTimeOutErrorCode = -2
};


@interface ResponseError : NSObject

@property (strong, nonatomic) NSNumber *code;
@property (strong, nonatomic) NSString *message;

@end
