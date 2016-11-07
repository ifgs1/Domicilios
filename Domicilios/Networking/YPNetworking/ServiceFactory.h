//
//  
//  Domicilios
//
//  Created by Ivan F Garcia S on 11/7/16.
//  Copyright © 2016 Ivan F Garcia S. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "DataRequest.h"
#import "ResponseError.h"
#import "YPReachability.h"

typedef void (^ServiceResponse)(BOOL success, id response);

@interface ServiceFactory : NSObject

extern BOOL const YPUseMocks;



+ (BOOL)hasRootAccess;

- (BOOL)canReachInternetConnection;

- (void)sendRequest:(DataRequest *)request withResponseBlock:(ServiceResponse)responseBlock;

@end
