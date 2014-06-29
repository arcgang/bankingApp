//
//  STViewController.h
//  SunTrust
//
//  Created by Archan Ganguly on 6/14/14.
//  Copyright (c) 2014 Archan Ganguly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface STViewController : UIViewController <CLLocationManagerDelegate>

@property (nonatomic, strong) UISwipeGestureRecognizer *swipeGesture;

- (IBAction)unwindToPrevViewController:(UIStoryboardSegue *)unwindSegue;

@property (nonatomic, weak) IBOutlet UIButton *loginButton;
@property (nonatomic, weak) IBOutlet UIButton *ratesButton;

@property (strong, nonatomic) CLBeaconRegion *appBeaconRegion;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end
