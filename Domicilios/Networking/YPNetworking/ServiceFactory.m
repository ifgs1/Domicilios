//
//  
//  Domicilios
//
//  Created by Ivan F Garcia S on 11/7/16.
//  Copyright © 2016 Ivan F Garcia S. All rights reserved.
//

#import "ServiceFactory.h"

@interface ServiceFactory ()

@end

@implementation ServiceFactory

#pragma mark - Constants
BOOL const YPUseMocks = NO;

-(instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)sendRequest:(DataRequest *)request withResponseBlock:(ServiceResponse)responseBlock
{
    //subclass overide method
}

#pragma mark - Root Security

+ (BOOL)hasRootAccess
{
#if !(TARGET_IPHONE_SIMULATOR)
    //Checks for
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/Cydia.app"]){
        return YES;
    }else if([[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/MobileSubstrate.dylib"]){
        return YES;
    }else if([[NSFileManager defaultManager] fileExistsAtPath:@"/bin/bash"]){
        return YES;
    }else if([[NSFileManager defaultManager] fileExistsAtPath:@"/usr/sbin/sshd"]){
        return YES;
    }else if([[NSFileManager defaultManager] fileExistsAtPath:@"/etc/apt"]){
        return YES;
    }
    
    NSError *error;
    NSString *stringToBeWritten = @"This is a test.";
    [stringToBeWritten writeToFile:@"/private/jailbreak.txt" atomically:YES
                          encoding:NSUTF8StringEncoding error:&error];
    if(error==nil){
        //Able to write so evice is jailbroken
        return YES;
    } else {
        [[NSFileManager defaultManager] removeItemAtPath:@"/private/jailbreak.txt" error:nil];
    }
    
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://package/com.example.package"]]){
        //Device is jailbroken
        return YES;
    }
#endif
    //All checks have failed. Most probably, the device is not jailbroken
    return NO;
}
#pragma mark - Methods

- (BOOL)canReachInternetConnection
{
    YPReachability *reachability  = [YPReachability reachabilityForInternetConnection];
    NSInteger networkStatus = [reachability currentReachabilityStatus];
    return networkStatus != NotReachable;
}


@end
