//
//  STCustomerViewController.h
//  SunTrust
//
//  Created by Archan Ganguly on 6/14/14.
//  Copyright (c) 2014 Archan Ganguly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GHRevealViewController.h"

@interface STCustomerViewController : GHRevealViewController

@property (nonatomic, strong) NSString* controllerId;
- (void)revealToggle:(id)sender;
@end
