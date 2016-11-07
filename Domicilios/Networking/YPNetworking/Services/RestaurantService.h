//
//  RestaurantService.h
//  Domicilios
//
//  Created by Ivan F Garcia S on 11/7/16.
//  Copyright © 2016 Ivan F Garcia S. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RestaurantService : NSObject

+(RestaurantService *)shareRestaurantService;
-(void)getRestaurantsWithSuccess:(void (^)(BOOL success, id response))successBlock;

@end
