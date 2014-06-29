//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013,2014. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------

#import <Foundation/Foundation.h>
#import "IBMHttpRequest.h"
#import "IBMBaaSService.h"

/**
A Builder used to quickly create {@link IBMHttpRequest} instances.
 */
@interface IBMHttpRequestBuilder : NSObject

/**
 Creates a new IBMHttpRequestBuilder for an IBMBaaSService
@param service the IBMBaaSService that will use this builder
 */
-(id) initWithService: (IBMBaaSService*) service;

/**
 Creates a new IBMHttpRequestBuilder based on an existing IBMHttpRequest
 @param request the IBMHttpRequest to clone
 */
-(id) initWithRequest:(IBMHttpRequest*) request;

/**
 Invocation of this method uses the HTTP settings previously set on the IBMHttpRequestBuilder to create an IBMHttpRequest
 @return the IBMHttpRequest created by this builder
 */
-(IBMHttpRequest*) build;

/**
 Sets the NSData used for the HTTP PUT/POST payload
 @param contentStreamData the NSData used for the HTTP PUT/POST payload
 @return The IBMHttpRequestBuilder so that invocations can be chained.
 */
-(instancetype) setContentStreamData: (NSData*)contentStreamData;

/**
 Adds an HTTP header.  If the header name exists, it will be converted in a comma separated list.
 @param name The name of the header to add
 @param value The value of the header to add
 @return The IBMHttpRequestBuilder so that invocations can be chained.
 */
-(instancetype) addHeaderWithName: (NSString*) name andValue: (NSString*) value;

/**
 Removes the HTTP header from the request.
 @param name The name of the header to remove
 @return The IBMHttpRequestBuilder so that invocations can be chained.
 */
-(instancetype) removeHeaderWithName: (NSString*) name;

/**
 Sets an HTTP header.  If the header name is already present, it will replace the current header value.
 @param name The name of the header to set
 @param value The name of the value to set
 @return The IBMHttpRequestBuilder so that invocations can be chained.
 */
-(instancetype) setHeaderWithName: (NSString*) name andValue: (NSString*) value;

/**
 Sets the IBMHttpRequestDelegate used to handle the HTTP responses
 @param delegate The IBMHttpRequestDelegate to receive HTTP responses.
 @return The IBMHttpRequestBuilder so that invocations can be chained.
 */
-(instancetype) setDelegate: (IBMHttpRequestDelegate*) delegate;

/**
 Sets the HTTP method
 @param method The HTTP method to invoke
 @return The IBMHttpRequestBuilder so that invocations can be chained.
 */
-(instancetype) setMethod: (NSString*) method;

/**
 Sets the HTTP timeout
 @param timeout The timeout for the HTTP request
 @return The IBMHttpRequestBuilder so that invocations can be chained.
 */
-(instancetype) setTimeout:(NSTimeInterval) timeout;

/**
 Sets the relative URI for the HTTP request
 @param uri The relative URI for the HTTP request
 @return The IBMHttpRequestBuilder so that invocations can be chained.
 */
-(instancetype) setUri: (NSString*)uri;

/**
 Sets the URL for the HTTP request
 @param url The URL for the HTTP request
 @return The IBMHttpRequestBuilder so that invocations can be chained.
 */
-(instancetype) setUrl: (NSURL*)url;

/**
 @param requestCachePolicy The NSURLRequestCachePolicy for the HTTP request
 @return The IBMHttpRequestBuilder so that invocations can be chained.
 */
-(instancetype) setRequestCachePolicy: (NSURLRequestCachePolicy) requestCachePolicy;

/**
 Sets the IBMBaaSService that will make HTTP requests.
 @param service The IBMBaaSService making the HTTP request
 @return The IBMHttpRequestBuilder so that invocations can be chained.
 */
-(instancetype) setService: (IBMBaaSService*) service;

@end
