//
//
//  Domicilios
//
//  Created by Ivan F Garcia S on 11/7/16.
//  Copyright © 2016 Ivan F Garcia S. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SVProgressHUD.h"

@interface UIViewController(SVProgressHUD)

- (void)showActivityIndicator;
- (void)showActivityIndicatorWithMessage:(NSString *)message;
- (void)hideActivityIndicator;

@end
