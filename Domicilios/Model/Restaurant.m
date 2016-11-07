//
//  
//  Domicilios
//
//  Created by Ivan F Garcia S on 11/7/16.
//  Copyright © 2016 Ivan F Garcia S. All rights reserved.
//

#import "Restaurant.h"

@implementation Restaurant

- (void)copyFromJSON:(NSDictionary *)json
{
    self.categorias = [json objectForKey:@"categorias"];
    self.domicilio = [json objectForKey:@"domicilio"];
    self.logo_path = [json objectForKey:@"logo_path"];
    self.nombre = [json objectForKey:@"nombre"];
    self.rating = [json objectForKey:@"rating"];
    self.tiempo_domicilio = [json objectForKey:@"tiempo_domicilio"];
    self.ubicacion_txt = [json objectForKey:@"ubicacion_txt"];
}

@end
