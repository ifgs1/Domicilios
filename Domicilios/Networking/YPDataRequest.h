//
//  YPDataRequest.h
//  YP_Networking_Lib
//
//  Created by Derek Miller on 7/8/15.
//  Copyright (c) 2015 YellowPepper. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, RequestType) {
    GETRequest = 0,
    PUTRequest,
    POSTRequest,
};

typedef NS_ENUM(NSUInteger, HeaderType) {
    NoneHeaderType = 0,
    BasicAuthHeaderType,
};

@interface YPDataRequest : NSObject

@property (readwrite) NSInteger uuid;
@property (readwrite) NSInteger dataType;
@property (nonatomic, strong) NSDictionary *data;
@property (nonatomic, strong) NSString *endpoint;
@property (nonatomic) RequestType requestType;
@property (nonatomic) HeaderType headerType;
@property (nonatomic, strong) NSMutableDictionary *aditionalHeaders;

@end