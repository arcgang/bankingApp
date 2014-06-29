//
//  STViewController.m
//  SunTrust
//
//  Created by Archan Ganguly on 6/14/14.
//  Copyright (c) 2014 Archan Ganguly. All rights reserved.
//

#import "STViewController.h"

#define LIGHT_FONT      @"HelveticaNeue-Light"

@interface STViewController ()

@end

@implementation STViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // Initialize location manager and set ourselves as the delegate
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    // Create a NSUUID with the same UUID as the broadcasting beacon
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"E26C27F6-9789-416D-8502-CE48D330CE0A"];
    
    // Setup a new region with that UUID and same identifier as the broadcasting beacon
    self.appBeaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid
                                                             identifier:@"com.gangooli.suntrust.branchRegion"];
    
    // Tell location manager to start monitoring for the beacon region
    [self.locationManager startMonitoringForRegion:self.appBeaconRegion];
    
    
	// Do any additional setup after loading the view, typically from a nib.
    
    self.swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipedScreen:)];
    self.swipeGesture.numberOfTouchesRequired = 1;
    self.swipeGesture.direction = (UISwipeGestureRecognizerDirectionRight);
    
    
    
    UIColor* darkColor = [UIColor colorWithRed:62.0/255 green:48.0/255 blue:55.0/255 alpha:0.7f];
    self.loginButton.backgroundColor = darkColor;
    self.loginButton.titleLabel.font = [UIFont fontWithName:LIGHT_FONT size:20.0f];
    [self.loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.5f] forState:UIControlStateHighlighted];
    self.loginButton.layer.shadowRadius=3.0f;
    self.loginButton.layer.shadowColor = [UIColor blackColor].CGColor;
    self.loginButton.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    self.loginButton.layer.shadowOpacity = 0.5f;
    self.loginButton.layer.masksToBounds = NO;
    
    self.ratesButton.backgroundColor = darkColor;
    self.ratesButton.titleLabel.font = [UIFont fontWithName:LIGHT_FONT size:20.0f];
    [self.ratesButton setTitle:@"Rates" forState:UIControlStateNormal];
    [self.ratesButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.ratesButton setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.5f] forState:UIControlStateHighlighted];


}

- (void)swipedScreen:(UISwipeGestureRecognizer*)gesture {
    
    UIView* view = gesture.view;
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.75;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype =kCATransitionFromLeft;
    transition.delegate = self;
    [self.view.layer addAnimation:transition forKey:nil];
    [view removeFromSuperview];
    [view removeGestureRecognizer:self.swipeGesture];
}

- (IBAction)unwindToPrevViewController:(UIStoryboardSegue *)unwindSegue
{
//    
//    UIViewController* sourceViewController = unwindSegue.sourceViewController;
//    [self performSegueWithIdentifier:@"unwindToHome" sender:sourceViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)locationManager:(CLLocationManager*)manager didEnterRegion:(CLRegion*)region
{
    [self.locationManager startRangingBeaconsInRegion:self.appBeaconRegion];
    
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.alertBody = @"Welcome to your bank branch. Our executives would be very happy to help you!";
    notification.soundName = @"Default";
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
}

-(void)locationManager:(CLLocationManager*)manager didExitRegion:(CLRegion*)region
{
    [self.locationManager stopRangingBeaconsInRegion:self.appBeaconRegion];
    
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.alertBody = @"Please visit us again!";
    notification.soundName = @"Default";
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
  
}

-(void)locationManager:(CLLocationManager*)manager
       didRangeBeacons:(NSArray*)beacons
              inRegion:(CLBeaconRegion*)region
{
    // Beacon found!
//    self.statusLabel.text = @"Beacon found!";
    
    CLBeacon *foundBeacon = [beacons firstObject];
    
    // You can retrieve the beacon data from its properties
//    NSString *uuid = foundBeacon.proximityUUID.UUIDString;
//    NSString *major = [NSString stringWithFormat:@"%@", foundBeacon.major];
//    NSString *minor = [NSString stringWithFormat:@"%@", foundBeacon.minor];
//    
//     NSLog(@"iBeacon detected: %@%@%@", uuid, major, minor);
    
   
}




@end
