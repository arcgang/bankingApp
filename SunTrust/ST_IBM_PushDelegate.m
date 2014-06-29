//
//  ST_IBM_PushDelegate.m
//  SunTrust
//
//  Created by Archan Ganguly on 6/22/14.
//  Copyright (c) 2014 Archan Ganguly. All rights reserved.
//

#import "ST_IBM_PushDelegate.h"

#define DEVICE_ALREADY_REGISTERED @"FPWSE0002E"

// Constants used in Push device.  You may change these are dynamically create them.
#define CONSUMER_ID @"SunTrustApp"
#define DEVICE_ALIAS  @"TargetDevice"

@implementation ST_IBM_PushDelegate

-(id) initWithDeviceToken:(NSString *)deviceToken
{
    self = [super init];
    if(self){
        if(deviceToken && ![deviceToken isEqualToString:@""]){
            _deviceToken = [NSString stringWithString:deviceToken];
        }else{
            [NSException raise:@"InvalidPushDeviceToken" format:@"Device token was nil"];
        }
    }
    return self;
}

-(void) onSuccess :(NSMutableDictionary*) response
{
    NSLog(@"onSuccess: %@", response);
}

-(void) onFailure :(NSMutableDictionary*) response
{
    if(![[response objectForKey:@"code"] isEqualToString: DEVICE_ALREADY_REGISTERED]){
        // We ignore device already registered errors as this is expected on the second call
        NSLog(@"onFailure: %@", response);
    }
}

-(void) registerDevice
{
    
    // Register Device to receive Push Notifications
    IBMPush *pushService = [IBMPush service];
    
    // Call the push service to register the device and listener
    [pushService registerDevice:DEVICE_ALIAS withConsumerId:CONSUMER_ID withDeviceToken:self.deviceToken withDelegate:self];
}

@end
