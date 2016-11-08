//
//  RestaurantDetailViewController.h
//  Domicilios
//
//  Created by Ivan F Garcia S on 11/7/16.
//  Copyright © 2016 Ivan F Garcia S. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Restaurant.h"

@interface RestaurantDetailViewController : UIViewController <MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIImageView *restaurantImageView;
@property (weak, nonatomic) IBOutlet UILabel *lblRestaurantNAme;
@property (weak, nonatomic) IBOutlet UILabel *lblRestaurantCategory;
@property (weak, nonatomic) IBOutlet UILabel *lblDeliveryTime;
@property (strong, nonatomic) Restaurant *restaurant;
@property (weak, nonatomic) IBOutlet UILabel *lblDomicilio;
@property (weak, nonatomic) IBOutlet UILabel *lblRestaurantRating;
@property (weak, nonatomic) IBOutlet UIView *mapContainerView;

@end
