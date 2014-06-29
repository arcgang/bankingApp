//
//  STAppDelegate.h
//  SunTrust
//
//  Created by Archan Ganguly on 6/14/14.
//  Copyright (c) 2014 Archan Ganguly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STCustomerViewController.h"
#import "Customer.h"

@interface STAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *nav;
@property (strong, nonatomic) UINavigationController *prevNav;

@property (strong, nonatomic) STCustomerViewController *customer;

@property (strong, nonatomic) Customer *customerModel;

@property (strong, nonatomic) NSString *customerID;

@property (strong, nonatomic) NSMutableArray *accountsArray;

@end
