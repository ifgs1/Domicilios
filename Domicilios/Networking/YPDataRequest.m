//
//  YPDataRequest.m
//  YP_Networking_Lib
//
//  Created by Derek Miller on 7/8/15.
//  Copyright (c) 2015 YellowPepper. All rights reserved.
//

#import "YPDataRequest.h"

@interface YPDataRequest ()

@end

@implementation YPDataRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        self.aditionalHeaders = [[NSMutableDictionary alloc] init];
    }
    return self;
}

@end