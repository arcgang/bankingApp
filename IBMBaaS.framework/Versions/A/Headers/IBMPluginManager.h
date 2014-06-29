//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013,2014. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------

#import <Foundation/Foundation.h>
#import "IBMBaaSPlugin.h"
#import "IBMDeviceIdProvider.h"
#import "IBMTransportFilter.h"
#import "IBMSecurityProvider.h"

/** 
 The IBMPluginManager is used to access to all registered plugins.  
 */
@interface IBMPluginManager : NSObject

+(instancetype) instance;

/** 
 Provides the ability to retrieve MBaaS Service Plugins.
 @param clazz The name of the IBMBaaSPlugin that is being requested.
 */
-(id<IBMBaaSPlugin>)getPluginByClassName:(NSString*)className;

/** 
 Query for all IBMBaaSPlugin objects of type className.  This will also return subclasses of className.
 @param clazz The name of the IBMBaaSPlugins that are being requested.
 @return a NSArray of IBMBaaSPlugin objects that are of the type className
 */
-(NSArray*)getPluginsByClassName:(NSString*)className;

/** 
 A method that gives extenders a way to programmatically register a plugin given a className.  The plugin class is created and registered by the IBMPluginManager.
 @param className the name of the plugin to be registered
 @param params the plugin's initialization parameters
 @return a reference to the newly created plugin or nil if the plugin could not be created
 */
-(void) registerPlugin: (id<IBMBaaSPlugin>)plugin;

-(void) unregisterPlugin: (id<IBMBaaSPlugin>) plugin;

#pragma mark Transport API
/**
 The IBMTransportFilter can be used to perform low level processing of HTTP requests
 before and after the request is made.
 
 @param filter adds a IBMTransportFilter for all HTTP requests made to the server
 */
-(void) addTransportFilter: (id<IBMTransportFilter>) filter;

/**
 Remove a IBMTransportFilter that was previously added.
 
 @param filter the IBMTransportFilter to remove
 */
-(void) removeTransportFilter: (id<IBMTransportFilter>) filter;



#pragma mark Security API
/**
 The IBMSecurityProvider is a plugin that controls IBMHttpRequest by allowing normal requests to halt upon specific response from the server.
 
 @return the current IBMSecurityProvider that is used for HTTP requests.
 */
-(id<IBMSecurityProvider>) securityProvider;

/**
 The IBMSecurityProvider is a plugin that controls IBMHttpRequest by allowing normal requests to halt upon specific response from the server.
 
 @param securityProvider the IBMSecurityProvider to be set for every request
 */
-(void) setSecurityProvider: (id<IBMSecurityProvider>) securityProvider;


#pragma mark Device Id Provider API
/**
 The IBMDeviceIdProvider is a plugin that controls the creation and retrieval of the device Id.
 
 @return the current IBMDeviceIdProvider.
 */
-(id<IBMDeviceIdProvider>) deviceIdProvider;

/**
 The IBMDeviceIdProvider is a plugin that controls the creation and retrieval of the device Id.
 
 @param deviceIdProvider the IBMDeviceIdProvider to be set for every request
 */
-(void) setDeviceIdProvider: (id<IBMSecurityProvider>) deviceIdProvider;

@end
