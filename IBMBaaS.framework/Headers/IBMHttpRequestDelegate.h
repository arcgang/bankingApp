//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013,2014. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------

#import "IBMBaaSBasePlugin.h"
@class IBMHttpRequest; 

/**
A protocol that extends the functionality of the NSURLConnectionDataDelegate.  All methods are optional and can be used to opt into intercepting responses from the HTTP request
*/
@protocol IBMUrlConnectionDelegate <NSURLConnectionDataDelegate>

@optional
/**
A delegate called after the IBMHttpRequestDelegate method connection:didReceiveResponse is called.  Extenders of IBMHttpRequestDelegate cannot override connection:didReceiveResponse.  Attempts to do so will be blocked at runtime.  Extenders should implement this method instead.
@param connection The connection corresponding to this response
@param response The response from the request
*/
- (void) handleConnection: (NSURLConnection*) connection didReceiveResponse:(NSURLResponse*) response;

/**
 A delegate called after the IBMHttpRequestDelegate method connection:didReceiveData is called.  Extenders of IBMHttpRequestDelegate cannot override connection:didReceiveData.  Attempts to do so will be blocked at runtime.  Extenders should implement this method instead.
 @param connection The connection corresponding to this response
 @param data The NSData from the response.
 */
- (void) handleConnection:(NSURLConnection *) connection didReceiveData:(NSData *)data;

/**
 A delegate called after the IBMHttpRequestDelegate method connection:didFailWithError is called.  Extenders of IBMHttpRequestDelegate cannot override connection:didFailWithError.  Attempts to do so will be blocked at runtime.  Extenders should implement this method instead.
 @param connection The connection corresponding to this response
 @param error The error from the response
 */
- (void) handleConnection:(NSURLConnection *) connection didFailWithError:(NSError *)error;

/**
 A delegate called after the IBMHttpRequestDelegate method connectionDidFinishLoading is called.  Extenders of IBMHttpRequestDelegate cannot override connectionDidFinishLoading.  Attempts to do so will be blocked at runtime.  Extenders should implement this method instead.
 @param connection The connection corresponding to this response
 */
- (void) handleConnectionDidFinishLoading:(NSURLConnection *)connection;

/**
Called when the response is detected as authorization failure by the configured IBMSecurityProvider 
 @param request The IBMHttpRequest for which this security check is being invoked.
*/
- (void) handleSecurity: (IBMHttpRequest*)request;
@end

/**
The base implementation for IBMUrlConnectionDelegate.  All API expects a subclass of IBMHttpResponseDelegate.  Extenders are not expected to implement the IBMUrlConnectionDelegate directly.  Extenders must extend IBMHttpRequestDelegate.  This is checked at runtime.
*/
@interface IBMHttpRequestDelegate : IBMBaaSBasePlugin<IBMUrlConnectionDelegate>

/**
 A helper method to retreive NSData for the NSURLConnection.
 @param connection The connection used to retreive the connection NSData.
 */
-(NSData*) getResponseDataForConnection: (NSURLConnection*) connection;

/**
 A helper method to retreive NSURLResponse for the NSURLConnection.
 @param connection The connection used to retreive the connection NSURLResponse.
 */
-(NSURLResponse*) getResponseForConnection: (NSURLConnection*) connection;

/**
 A helper method to retreive IBMHttpRequest for the NSURLConnection.
 @param connection The connection used to retreive the connection IBMHttpRequest.
 */
-(IBMHttpRequest*) getRequestForConnection: (NSURLConnection*) connection;

@end 
