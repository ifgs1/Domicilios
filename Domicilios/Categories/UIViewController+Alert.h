//
//  
//  Domicilios
//
//  Created by Ivan F Garcia S on 11/7/16.
//  Copyright © 2016 Ivan F Garcia S. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Alert) <UIAlertViewDelegate>

- (void)showErrorViewWithMessage:(NSString *)message;
- (void)showAlertViewWithMessage:(NSString *)message;
- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message;
- (void)showAlertViewWithBlock:(NSString *)message :(void (^)())action;
- (void)showTimeOutAlert;
@end
