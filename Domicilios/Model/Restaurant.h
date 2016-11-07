//
// 
//  Domicilios
//
//  Created by Ivan F Garcia S on 11/7/16.
//  Copyright © 2016 Ivan F Garcia S. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface Restaurant : NSObject

@property (strong, nonatomic) NSString *nombre;
@property (strong, nonatomic) NSString *categorias;
@property (strong, nonatomic) NSNumber *rating;
@property (strong, nonatomic) NSNumber *tiempo_domicilio;
@property (strong, nonatomic) NSString *ubicacion_txt;
@property (strong, nonatomic) NSString *logo_path;
@property (strong, nonatomic) NSString *domicilio;


- (void)copyFromJSON:(NSDictionary *)json;

@end
