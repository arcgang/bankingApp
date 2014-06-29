//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013,2014. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------

#import <Foundation/Foundation.h>
@class IBMHttpRequestDelegate;
@class IBMBaaSService;

/**
IBMHttpRequest contains all the information that is needed in order to invoke an http request to a secured endpoint
*/
@interface IBMHttpRequest : NSObject

/**
The NSInputStream used in the HTTP connection
@return the NSInputStream for the HTTP request if it takes a payload (e.g. PUT, POST)
*/
@property (readonly, nonatomic) NSInputStream* contentStream;

/**
@return the HTTP headers for the request
 */
@property (readonly, nonatomic) NSDictionary* headers;

/**
@return the HTTP method for the request
 */
@property (readonly, nonatomic) NSString* method;

/**
@return The IBMHttpRequestDelegate for receiving HTTP responses and errors
 */
@property (readonly, nonatomic) IBMHttpRequestDelegate* delegate;

/**
 @return The timeout for the HTTP request
 */
@property (readonly, nonatomic) NSTimeInterval timeout;

/**
@return The target URL for the HTTP request
 */
@property (readonly, nonatomic) NSURL* url;

/**
@return the HTTP cache policy for the request.
 */
@property (readonly, nonatomic) NSURLRequestCachePolicy requestCachePolicy;

/**
@return the IBMBaaSService making the HTTP request
 */
@property (readonly, nonatomic) IBMBaaSService *service;

/**
Make the HTTP request
 */
-(NSURLConnection*) invoke;

@end
