//
//  IBMDeviceIdProvider.h
//  IBMBaaS
//
//  Created by chambrid on 3/25/14.
//  Copyright (c) 2014 International Business Machines. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import "IBMBaaSPlugin.h"

/**
 * This is the provider used for obtaining the device identifier.
 */
@protocol IBMDeviceIdProvider <IBMBaaSPlugin>

/**
 * The unique identifier for the device.
 */
@property (readonly, nonatomic) NSString* deviceId;

@end
