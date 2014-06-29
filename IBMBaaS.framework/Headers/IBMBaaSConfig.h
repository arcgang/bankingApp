//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013,2014. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------

#import <Foundation/Foundation.h>
#import "IBMBaaS.h"

/**
Provides access to the configuration for the IBMBaaS SDK.
*/
@interface IBMBaaSConfig : NSObject

/**
 The target baasUrl.  This can be used to override the target location for http requests.
 */
@property (readonly, nonatomic) NSString *baasUrl;

/**
 The applicationId used to communicate with MBaaS services.
 */
@property (readonly, nonatomic) NSString *applicationId;

/**
 The application version.
 */
@property (readonly, nonatomic) NSString *applicationVersion;

/**
 The deviceId that identifies the phone.
 */
@property (readonly, nonatomic) NSString *deviceId;

/**
 The deviceModel that identifies the phone.
 */
@property (readonly, nonatomic) NSString *deviceModel;

/**
 The devicePlatformVersion that the phone is running.
 */
@property (readonly, nonatomic) NSString *devicePlatformVersion;

/**
 The clientId is the bundleId of the application.
 */
@property (readonly, nonatomic) NSString *clientId;

/**
 The platform is IOS
 */
@property (readonly, nonatomic) NSString *platformId;

/**
 The security provider used to obtain and validate the token
 */
@property (readonly, nonatomic) NSString *securityProvider;

/**
 The security token for the user
 */
@property (readonly, nonatomic) NSString *securityToken;

/**
 Sets the security token and the provider used to obtain and validate it
 @param provider The security provider used to obtain and validate the token
 @param token The user's security token received from the provider
 */
-(void) setSecurityContext: (SecurityProvider) provider withToken: (NSString *) token;

/**
 Resets the OAuth configuration to nil
 */
-(void) clearSecurityContext;


/**
 A method to get the IBMCore Framework version.
 @return The SDK version. Format vMajor.Minor.Service.Qualifier
 */
@property (readonly, nonatomic) NSString *version;

+(instancetype) instance;

/**
 Provides the ability to set and retrieve arbitraty configuration in the form of key/value pairs.
@param key The key from the JSON configuration for the value that is being looked up.
@return The value associated with this JSON key
 */
-(id) getConfigurationSetting: (NSString*) key;

/**
 Provides the ability to retrieve all properties as a NSDictionary.
 @return NSDictionary
 */
-(NSDictionary*) getConfigurationSettings;

/**
 Provides access to a class based JSON configuration block
 
@param className the className to be looked up
@return the JSON configuration for the class
 */
-(NSDictionary*) getPluginConfigurationSettings: (NSString*) className;

@end
