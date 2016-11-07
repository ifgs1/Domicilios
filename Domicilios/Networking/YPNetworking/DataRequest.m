//
//  
//  Domicilios
//
//  Created by Ivan F Garcia S on 11/7/16.
//  Copyright © 2016 Ivan F Garcia S. All rights reserved.
//

#import "DataRequest.h"

@interface DataRequest ()

@end

@implementation DataRequest

- (instancetype)init {
    self = [super init];
    if (self) {
        self.aditionalHeaders = [[NSMutableDictionary alloc] init];
    }
    return self;
}

@end