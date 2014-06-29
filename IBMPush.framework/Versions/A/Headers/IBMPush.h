//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------

#import <Foundation/Foundation.h>

#import <IBMBaaS/IBMBaaSService.h>
#import <IBMPush/IBMPushResponseListener.h>

/*!
 * @class Operations supported by the Push Notification SDK
 *
 */
@interface IBMPush : IBMBaaSService{
	
	NSString* deviceToken;
}

@property (readonly,nonatomic) NSString* endpoint;
@property NSInteger defaultTimeout;


/*!
 * Gets all the available Tags for the backend mobile application
 *
 * @param applicationTagsDelegate - the delegate on which either success or failure is called on finishing the request.
 */
- (void) getTagsUsingDelegate :(id<IBMPushResponseListener>)applicationTagsDelegate;

/*!
 * Gets the Tags that are subscribed by the device
 *
 * @param subscriptionsDelegate - the delegate on which either success or failure is called on finishing the request.
 */
- (void) getSubscriptionsUsingDelegate :(id<IBMPushResponseListener>) subscriptionsDelegate;

/*!
 * Registers the device on to the Push Notification Server
 *
 * @param alias - the alias of the device that needs to be registered.
 * @param consumerId - the consumerId of the user.
 * @param devToken - the device token received from APNS.
 * @param registerDelegate - the delegate on which either success or failure is called on finishing the request.
 */
- (void) registerDevice : (NSString*) alias withConsumerId : (NSString*) consumerId withDeviceToken : (NSString*) devToken withDelegate : (id<IBMPushResponseListener>) registerDelegate;

/*!
 * Subscribes to a particular backend mobile application Tag
 *
 * @param tag - The Tag name to subscribe to.
 * @param subscribeToTagDelegate - the delegate on which either success or failure is called on finishing the request.
 */
- (void) subscribeToTag :(NSString*) tag withDelegate :(id<IBMPushResponseListener>) subscribeToTagDelegate;

/*!
 * Unsubscribes from an backend mobile application Tag
 *
 * @param tag - The Tag name to unsubscribe from.
 * @param unSubscribeFromTagDelegate - the delegate on which either success or failure is called on finishing the request.
 */
- (void) unsubscribeFromTag :(NSString*) tag withDelegate :(id<IBMPushResponseListener>) unSubscribeFromTagDelegate;

+(instancetype) initializeService;
+(instancetype) service;


@end