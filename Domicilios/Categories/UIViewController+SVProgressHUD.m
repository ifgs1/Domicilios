//
//  
//  Domicilios
//
//  Created by Ivan F Garcia S on 11/7/16.
//  Copyright © 2016 Ivan F Garcia S. All rights reserved.
//

#import "UIViewController+SVProgressHUD.h"

@implementation UIViewController(SVProgressHUD)

- (void)showActivityIndicator {
//    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleLight];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD show];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)showActivityIndicatorWithMessage:(NSString *)message {
//    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleLight];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showWithStatus:message];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)hideActivityIndicator {
    dispatch_async(dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    });
}

@end
