//
//  Customer.h
//  SunTrust
//
//  Created by Archan Ganguly on 6/16/14.
//  Copyright (c) 2014 Archan Ganguly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Customer : NSObject

@property (strong,atomic) NSString* fullName;
@property (strong,atomic) NSDictionary* accounts;
@property (strong,atomic) NSString* city;
@property (strong,atomic) NSString* state;

@end
