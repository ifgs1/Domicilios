//
//  
//  Domicilios
//
//  Created by Ivan F Garcia S on 11/7/16.
//  Copyright © 2016 Ivan F Garcia S. All rights reserved.
//

#import "UIViewController+Alert.h"

@implementation UIViewController (Alert)

- (void)showErrorViewWithMessage:(NSString *)message
{
    [self showAlertViewWithTitle:NSLocalizedString(@"Error", @"Error") message:message];
}

- (void)showAlertViewWithMessage:(NSString *)message
{
    [self showAlertViewWithTitle:NSLocalizedString(@"generic_title_message", @"Message") message:message];
}

- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message
{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:title
                                                       message:message
                                                      delegate:nil
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)showTimeOutAlert
{
    [self showAlertViewWithTitle:NSLocalizedString(@"generic_title_message", @"Message") message:@"Se ha presentado un error de comunicación. Por favor intente en unos minutos."];
}

@end
