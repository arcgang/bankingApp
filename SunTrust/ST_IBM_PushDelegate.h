//
//  ST_IBM_PushDelegate.h
//  SunTrust
//
//  Created by Archan Ganguly on 6/22/14.
//  Copyright (c) 2014 Archan Ganguly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IBMPush/IBMPush.h>

@interface ST_IBM_PushDelegate : NSObject<IBMPushResponseListener>

@property(nonatomic, readonly) NSString *deviceToken;

-(id) initWithDeviceToken: (NSString*) deviceToken;
-(void) registerDevice;

@end
