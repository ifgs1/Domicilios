//
//  ViewController.m
//  Domicilios
//
//  Created by Ivan F Garcia S on 11/7/16.
//  Copyright © 2016 Ivan F Garcia S. All rights reserved.
//

#import "ViewController.h"
#import "RestaurantService.h"
#import "UIViewController+Alert.h"
#import "UIViewController+SVProgressHUD.h"
#import "Restaurant.h"
#import "RestaurantCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "RestaurantDetailViewController.h"
#import "ActionSheetPicker.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableviewRestaurant;
@property (nonatomic, strong) NSMutableArray *restaurants;
@property (nonatomic, strong) NSMutableArray *filteredRestaurants;
@property (nonatomic, strong) NSMutableArray *categories;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Restaurantes";
    // Do any additional setup after loading the view, typically from a nib.
    [self showActivityIndicator];
    [[RestaurantService shareRestaurantService] getRestaurantsWithSuccess:^(BOOL success, id response) {
        [self hideActivityIndicator];
        self.restaurants = [[NSMutableArray alloc]init];
        self.categories = [[NSMutableArray alloc]init];

        if (success) {
            for (NSDictionary *json in response) {
                Restaurant *restaurant = [Restaurant new];
                [restaurant copyFromJSON:json];
                [self.restaurants addObject:restaurant];
                [self.categories addObject:restaurant.categorias];
            }
        [self.tableviewRestaurant reloadData];
        }else{
            [self showAlertViewWithMessage:@"Se ha presentado un error de comunicación"];
        }
        
    }];
       
}

#pragma mark: TableView delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.filteredRestaurants.count > 0) {
        return [self.filteredRestaurants count];

    }else{
        return [self.restaurants count];

    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"RestaurantCell";
    RestaurantCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil)
    {
        cell = [[RestaurantCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:MyIdentifier];
    }
    [self setUpCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)setUpCell:(RestaurantCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    NSMutableArray *restaurants;
    if (self.filteredRestaurants.count > 0) {
        restaurants = [[NSMutableArray alloc]initWithArray:self.filteredRestaurants];
    }else{
        restaurants = [[NSMutableArray alloc]initWithArray:self.restaurants];
        
    }
    Restaurant *restaurant = [restaurants objectAtIndex:indexPath.row];

    cell.titleLabel.text = restaurant.nombre;
    cell.subTitleLabel.text = restaurant.categorias;
    UIImage *img = [UIImage imageNamed:@"restaurant-placeholder"];
     [cell.imageViewCell sd_setImageWithURL:[NSURL URLWithString:restaurant.logo_path] placeholderImage:img];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *restaurants;
    if (self.filteredRestaurants.count > 0) {
        restaurants = [[NSMutableArray alloc]initWithArray:self.filteredRestaurants];
    }else{
        restaurants = [[NSMutableArray alloc]initWithArray:self.restaurants];
        
    }
    Restaurant *restaurant = [restaurants objectAtIndex:indexPath.row];
     RestaurantDetailViewController *confirmationViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RestaurantDetailViewController"];
    confirmationViewController.restaurant = restaurant;
    [self.navigationController pushViewController:confirmationViewController animated:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray *)filterRestaurants:(NSString *)filterString andQuery:(NSString *)quesryString{
    
    NSString * predicateString = [NSString stringWithFormat:@"%@ %@",filterString,@"CONTAINS[cd] %@"];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:predicateString,
                              quesryString];
    
    NSArray *filteredArray = [self.restaurants filteredArrayUsingPredicate:predicate];
    
    return filteredArray;
}
- (IBAction)filterContent:(id)sender {
    
    [ActionSheetStringPicker showPickerWithTitle:@"Categorías"
                                            rows:self.categories
                                initialSelection:0
                                       doneBlock:^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
                                           self.filteredRestaurants = [[NSMutableArray alloc]initWithArray:[self filterRestaurants:@"categorias" andQuery:selectedValue]];
                                           [self.tableviewRestaurant reloadData];
                                       }
                                     cancelBlock:^(ActionSheetStringPicker *picker) {

                                     
                                     }
                                          origin:sender];
}

@end
