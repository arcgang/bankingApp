//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013,2014. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------

#import <IBMBaaS/IBMBaaS.h>

/** IBMCloudCodeService provides the ability to call cloud code functions defined in the mobile backend */
@interface IBMCloudCode : IBMBaaSService

/**
 @param hostName The IBMBaaS Mobile Backend host name
 @return The instance of the initialized Cloud Code Service
 */
+(IBMCloudCode *) initializeService: (NSString*) hostName;

/**
 @return The instance of the Cloud Code Service; if initialized
 */
+(IBMCloudCode *) service;

/**
 Used to make an HTTP GET request to IBM Cloud Code
@param uri The URI for the Cloud Code that will be invoked.
@param delegate The IBMHttpRequestDelegate used to handle HTTP responses
 */
-(void) get: (NSString*) uri withDelegate: (IBMHttpRequestDelegate*) delegate;

/**
 Used to make an HTTP GET request to IBM Cloud Code
 @param uri The URI for the Cloud Code that will be invoked.
 @param delegate The IBMHttpRequestDelegate used to handle HTTP responses
 @param headers A NSDictionary of headers that need to be set for the IBM Cloud Code Request. Headers are expected to be a NSDictionary with the format 'NSDictionary<NSString, NSArray<NSString>>'.  In other words, its a dictionary with String keys which points to Arrays of Strings.  Any other format will be ignored and logged
 */
-(void) get: (NSString*) uri withDelegate: (IBMHttpRequestDelegate*) delegate withHeaders: (NSDictionary*) headers;

/**
 Used to make an HTTP PUT request to IBM Cloud Code
 @param uri The URI for the Cloud Code that will be invoked.
 @param json The JSON payload to send with the request.
 @param delegate The IBMHttpRequestDelegate used to handle HTTP responses
 */
-(void) put: (NSString*) uri withDelegate: (IBMHttpRequestDelegate*) delegate withJsonPayload: (NSDictionary*) json;

/**
 Used to make an HTTP PUT request to IBM Cloud Code
 @param uri The URI for the Cloud Code that will be invoked.
 @param json The JSON payload to send with the request.
 @param delegate The IBMHttpRequestDelegate used to handle HTTP responses
 @param headers A NSDictionary of headers that need to be set for the IBM Cloud Code Request. Headers are expected to be a NSDictionary with the format 'NSDictionary<NSString, NSArray<NSString>>'.  In other words, its a dictionary with String keys which points to Arrays of Strings.  Any other format will be ignored and logged
 */
-(void) put: (NSString*) uri withDelegate: (IBMHttpRequestDelegate*) delegate withJsonPayload: (NSDictionary*) json withHeaders: (NSDictionary*) headers;

/**
 Used to make an HTTP PUT request to IBM Cloud Code
 @param uri The URI for the Cloud Code that will be invoked.
 @param data The data payload to send with the request.
 @param delegate The IBMHttpRequestDelegate used to handle HTTP responses
 @param headers A NSDictionary of headers that need to be set for the IBM Cloud Code Request. Headers are expected to be a NSDictionary with the format 'NSDictionary<NSString, NSArray<NSString>>'.  In other words, its a dictionary with String keys which points to Arrays of Strings.  Any other format will be ignored and logged
 */
-(void) put: (NSString*) uri withDelegate: (IBMHttpRequestDelegate*) delegate withDataPayload: (NSData*) data withHeaders: (NSDictionary*) headers;

/**
 Used to make an HTTP POST request to IBM Cloud Code
 @param uri The URI for the Cloud Code that will be invoked.
 @param json The JSON payload to send with the request.
 @param delegate The IBMHttpRequestDelegate used to handle HTTP responses
 */
-(void) post: (NSString*) uri withDelegate: (IBMHttpRequestDelegate*) delegate withJsonPayload: (NSDictionary*) json;

/**
 Used to make an HTTP POST request to IBM Cloud Code
 @param uri The URI for the Cloud Code that will be invoked.
 @param json The JSON payload to send with the request.
 @param delegate The IBMHttpRequestDelegate used to handle HTTP responses
 @param headers A NSDictionary of headers that need to be set for the IBM Cloud Code Request. Headers are expected to be a NSDictionary with the format 'NSDictionary<NSString, NSArray<NSString>>'.  In other words, its a dictionary with String keys which points to Arrays of Strings.  Any other format will be ignored and logged
 */
-(void) post: (NSString*) uri withDelegate: (IBMHttpRequestDelegate*) delegate withJsonPayload: (NSDictionary*) json withHeaders: (NSDictionary*) headers;

/**
 Used to make an HTTP POST request to IBM Cloud Code
 @param uri The URI for the Cloud Code that will be invoked.
 @param data The data payload to send with the request.
 @param delegate The IBMHttpRequestDelegate used to handle HTTP responses
 @param headers A NSDictionary of headers that need to be set for the IBM Cloud Code Request. Headers are expected to be a NSDictionary with the format 'NSDictionary<NSString, NSArray<NSString>>'.  In other words, its a dictionary with String keys which points to Arrays of Strings.  Any other format will be ignored and logged
 */
-(void) post: (NSString*) uri withDelegate: (IBMHttpRequestDelegate*) delegate withDataPayload: (NSData*) data withHeaders: (NSDictionary*) headers;

/**
 Used to make an HTTP DELETE request to IBM Cloud Code
 @param uri The URI for the Cloud Code that will be invoked.
 @param delegate The IBMHttpRequestDelegate used to handle HTTP responses
 */
-(void) delete: (NSString*) uri withDelegate: (IBMHttpRequestDelegate*) delegate;

/**
 Used to make an HTTP DELETE request to IBM Cloud Code
 @param uri The URI for the Cloud Code that will be invoked.
 @param delegate The IBMHttpRequestDelegate used to handle HTTP responses
 @param headers A NSDictionary of headers that need to be set for the IBM Cloud Code Request. Headers are expected to be a NSDictionary with the format 'NSDictionary<NSString, NSArray<NSString>>'.  In other words, its a dictionary with String keys which points to Arrays of Strings.  Any other format will be ignored and logged
 */
-(void) delete: (NSString*) uri withDelegate: (IBMHttpRequestDelegate*) delegate withHeaders: (NSDictionary*) headers;

@end
