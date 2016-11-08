//
//  RestaurantDetailViewController.m
//  Domicilios
//
//  Created by Ivan F Garcia S on 11/7/16.
//  Copyright © 2016 Ivan F Garcia S. All rights reserved.
//

#import "RestaurantDetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation RestaurantDetailViewController

-(void)viewDidLoad{
    
    [super viewDidLoad];
    [self setUpUI];

}

-(void)setUpUI{
    self.mapView.showsUserLocation = YES;
    self.lblRestaurantNAme.text = self.restaurant.nombre;
    self.lblRestaurantCategory.text = self.restaurant.categorias;
    self.lblDeliveryTime.text = [NSString stringWithFormat:@"Tiempo de entrega: %@ minutos",self.restaurant.tiempo_domicilio];
    self.lblDomicilio.text = [NSString stringWithFormat:@"Domicilio: $%@",self.restaurant.domicilio];
    self.lblRestaurantRating.text = [NSString stringWithFormat:@"Calificación: %@ estrellas",self.restaurant.rating];
    self.title = self.restaurant.nombre;
    if (self.restaurant.ubicacion_txt.length >0) {
        NSArray *location = [self.restaurant.ubicacion_txt componentsSeparatedByString:@","];
        CLLocationDegrees latitude = [location[0] doubleValue];
        
        CLLocationDegrees longitude = [location[1] doubleValue];
        
        CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(latitude, longitude);
        
        MKCoordinateSpan span = MKCoordinateSpanMake(0.1, 0.1);
        MKCoordinateRegion region = {coord, span};
        
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        annotation.title = self.restaurant.nombre;
        [annotation setCoordinate:coord];
        
        [self.mapView setRegion:region];
        [self.mapView addAnnotation:annotation];
    }
    UIImage *img = [UIImage imageNamed:@"restaurant-placeholder"];
    [self.restaurantImageView sd_setImageWithURL:[NSURL URLWithString:self.restaurant.logo_path] placeholderImage:img];
    

}
@end
