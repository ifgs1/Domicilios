//
//  RestaurantService.m
//  Domicilios
//
//  Created by Ivan F Garcia S on 11/7/16.
//  Copyright © 2016 Ivan F Garcia S. All rights reserved.
//

#import "RestaurantService.h"
#import "DomiciliosServiceFactory.h"
#import "DataRequest.h"

@implementation RestaurantService

+ (instancetype)shareRestaurantService
{
    static dispatch_once_t pred = 0;
    __strong static id _shareHelpService = nil;
    dispatch_once(&pred, ^{
        _shareHelpService = [[self alloc] init];
    });
    return _shareHelpService;
}

-(void)getRestaurantsWithSuccess:(void (^)(BOOL success, id response))successBlock{
    DataRequest *request = [DataRequest new];
    request.requestType = GETRequest;
    request.headerType = NoneHeaderType;
    request.endpoint = @"bins/1zib8";
    [request.aditionalHeaders setObject:@"application/json" forKey:@"Content-Type"];
    [[DomiciliosServiceFactory sharedYPNonPCIService] sendRequest:request withResponseBlock:^(BOOL success, id response) {
        successBlock(success, response);
    }];


}
@end
