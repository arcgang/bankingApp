//
//  STAppDelegate.m
//  SunTrust
//
//  Created by Archan Ganguly on 6/14/14.
//  Copyright (c) 2014 Archan Ganguly. All rights reserved.
//

#import "STAppDelegate.h"

#import <IBMBaaS/IBMBaaS.h>
#import <IBMCloudCode/IBMCloudCode.h>
#import <IBMPush/IBMPush.h>

#import "ST_IBM_PushDelegate.h"

@interface STAppDelegate()

@property ST_IBM_PushDelegate *pushDelegate;

@end

@implementation STAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    NSString *applicationId = nil;
    NSString *hostName = nil;
    
    BOOL hasValidConfiguration = YES;
    NSString *errorMessage = @"";
    
    // Read the applicationId and applicationHostName from the configuration.plist.
    NSString *configurationPath = [[NSBundle mainBundle] pathForResource:@"configuration" ofType:@"plist"];
    if(configurationPath){
        NSDictionary *configuration = [[NSDictionary alloc] initWithContentsOfFile:configurationPath];
        applicationId = [configuration objectForKey:@"applicationId"];
        if(!applicationId || [applicationId isEqualToString:@""]){
            hasValidConfiguration = NO;
            errorMessage = @"Open the configuration.plist and set the applicationId to the BlueMix applicationId";
        }
        
    }
    
    if(hasValidConfiguration){
        // Initialize the SDK and BlueMix services
        [IBMBaaS initializeSDK: applicationId];
        [IBMCloudCode initializeService:@"mSunTrust.ng.bluemix.net"];
    
        
        [IBMPush initializeService];
        
        // Register application for push notifications
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    }else{
        [NSException raise:@"InvalidApplicationConfiguration" format: @"%@", errorMessage];
    }
    

    
    
    
    // Override point for customization after application launch.
    return YES;
}

#pragma mark - Methods for receiving device registration and notifications
-(void) application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    self.pushDelegate = [[ST_IBM_PushDelegate alloc]initWithDeviceToken:deviceToken.description];
    [self.pushDelegate registerDevice];
}

-(void) application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    // Handle remote Push notification by reloading the list and getting the latest data
    NSLog(@"Received Push Notification, account did get updated!");
    //[self.listViewController listItems: nil];
}


-(void) application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    // Handle remote Push notification by reloading the list and getting the latest data
    NSLog(@"Failed to register! %@", error.description);
    //[self.listViewController listItems: nil];
}

							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
