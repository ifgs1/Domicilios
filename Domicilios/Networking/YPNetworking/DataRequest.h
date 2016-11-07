//
//  
//  Domicilios
//
//  Created by Ivan F Garcia S on 11/7/16.
//  Copyright © 2016 Ivan F Garcia S. All rights reserved.
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

@interface DataRequest : NSObject

@property (readwrite) NSInteger uuid;
@property (readwrite) NSInteger dataType;
@property (nonatomic, strong) NSDictionary *data;
@property (nonatomic, strong) NSString *endpoint;
@property (nonatomic) RequestType requestType;
@property (nonatomic) HeaderType headerType;
@property (nonatomic, strong) NSMutableDictionary *aditionalHeaders;

@end