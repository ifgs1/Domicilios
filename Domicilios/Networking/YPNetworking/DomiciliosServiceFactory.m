//
//  
//  Domicilios
//
//  Created by Ivan F Garcia S on 11/7/16.
//  Copyright © 2016 Ivan F Garcia S. All rights reserved.
//

#import "DomiciliosServiceFactory.h"

@interface DomiciliosServiceFactory()
@property (nonatomic, strong) NSTimer *timeOutTimer;
@end

@implementation DomiciliosServiceFactory

+ (instancetype)sharedYPNonPCIService
{
    static dispatch_once_t pred = 0;
    static id __strong _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });

    return _sharedObject;
}


#pragma mark - Network Services

- (void)sendRequest:(DataRequest *)request withResponseBlock:(ServiceResponse)responseBlock
{
    if (![self canReachInternetConnection]) {
        ResponseError *responseError = [ResponseError new];
        responseError.code = @(YPNetworkNoInternetConnectionCode);
        responseError.message = @"Se ha presentado un error de comunicación.";
        responseBlock(NO, responseError);
        return;
    }
    
    NSString *baseURL = @"https://api.myjson.com/";
    
    if (baseURL) {
        AFHTTPRequestOperationManager *ypService = [AFHTTPRequestOperationManager manager];
        ypService.requestSerializer =  [AFJSONRequestSerializer serializer];
        ypService.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
        ypService.requestSerializer.timeoutInterval = 100;
        
        for (NSString *key in request.aditionalHeaders.allKeys) {
            [ypService.requestSerializer setValue:request.aditionalHeaders[key] forHTTPHeaderField:key];
        }
        
        // Put together full endpoint URL
        NSString *fullEndpointURL = [baseURL stringByAppendingString:request.endpoint];
        
        NSLog(@"Endpoint: %@", fullEndpointURL);
        if (request.aditionalHeaders) {
            NSLog(@"Request Headers: %@", request.aditionalHeaders);
        }
        if (request.data) {
           NSLog(@"Request Data: %@", request.data);
        }
        
        [self startTimeOutTimerwithBlockWithResponseBlock:responseBlock];
        
        if (request.requestType == GETRequest) {
            [ypService GET:fullEndpointURL parameters:request.data success:^(AFHTTPRequestOperation *operation, id responseObject) {
                [self voidTimer];
                NSLog(@"Response: %@", responseObject);
                responseBlock(YES, responseObject);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [self voidTimer];
            }];
        } else if (request.requestType == PUTRequest) {
            [ypService PUT:fullEndpointURL parameters:request.data success:^(AFHTTPRequestOperation *operation, id responseObject) {
                [self voidTimer];
                NSLog(@"Response: %@", responseObject);
                responseBlock(YES, responseObject);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [self voidTimer];
            }];
        } else if (request.requestType == POSTRequest) {
            [ypService POST:fullEndpointURL parameters:request.data success:^(AFHTTPRequestOperation *operation, id responseObject) {
                [self voidTimer];
                NSLog(@"Response: %@", responseObject);
                responseBlock(YES, responseObject);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [self voidTimer];
            }];
        } else {
            [self voidTimer];
            NSLog(@"Request type for %@ not defined", request);
        }
    } else {
      
        return;
    }
}

- (void)startTimeOutTimerwithBlockWithResponseBlock:(ServiceResponse)responseBlock
{
    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
    [userInfo setValue:responseBlock forKey:@"blockTest"];
    self.timeOutTimer = [NSTimer scheduledTimerWithTimeInterval:100 target:self selector:@selector(timeOut) userInfo:userInfo repeats:NO];
}

- (void)timeOut {
    ResponseError *timeoutError = [[ResponseError alloc] init];
    timeoutError.code = @408;
    timeoutError.message = @"El servidor no responde, intenta en unos minutos.";
    void (^ServiceResponse)(BOOL success, id response);
    ServiceResponse = [self.timeOutTimer.userInfo valueForKey:@"blockTest"];
    if (ServiceResponse) {
        ServiceResponse(NO, timeoutError);
    }
    [self voidTimer];
}

- (void)voidTimer
{
    [self.timeOutTimer invalidate];
    self.timeOutTimer = nil;
}

@end