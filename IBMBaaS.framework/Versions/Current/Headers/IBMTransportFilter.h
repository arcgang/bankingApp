//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013,2014. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------

#import <Foundation/Foundation.h>
#import "IBMBaaSPlugin.h"
#import "IBMHttpRequest.h"

@protocol IBMTransportFilter <IBMBaaSPlugin>

-(IBMHttpRequest*) processRequest: (IBMHttpRequest*)request;
-(NSURLResponse*)processResponse: (NSURLResponse*) response;

@end
