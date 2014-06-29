//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013,2014. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------

#import <Foundation/Foundation.h>
#import <IBMBaaS/IBMHttpRequest.h>
#import <IBMBaaS/IBMHttpRequestBuilder.h>
#import <IBMBaaS/IBMHttpRequestDelegate.h>
#import <IBMBaaS/IBMUriBuilder.h>

typedef enum SecurityProvider{
    GOOGLE, WORKLIGHT
}SecurityProvider;

/**
 IBMBaaS is the entry point for interacting with the MBaaS SDKs. The method initializeSDK must be invoked before any other API calls. IBMBaaS provides information about the current SDK level and access to service plugins. Below is an example of initializing the SDK and using the IBMPluginManager to access a service plugin.
 
 [IBMBaaS initializeSDK: applicationId];
 IBMPush * pushService = [IBMPush initializeService];
 
 */
@interface IBMBaaS : NSObject

#pragma mark SDK Initialization API
/** This must be the first method called.  It initializes the SDK framework.
 
 @param applicationId the IBM Backend as a Service application ID
 */
+(void) initializeSDK: (NSString*)applicationId;

/** 
 Method to obtain the current IBM Backend as a Service Id
 @return The current IBM Backend as a Service application Id
 */
+(NSString*) applicationId;

/**
 Sets the security token and the provider used to obtain and validate it
 @param provider The security provider used to obtain and validate the token
 @param token The user's security token received from the provider
 */
+(void) setSecurityContext: (SecurityProvider) provider withToken: (NSString *) token;

/**
  Resets the security context to nil
 */
+(void) clearSecurityContext;

@end
