//-------------------------------------------------------------------------------
// Licensed Materials - Property of IBM
// XXXX-XXX (C) Copyright IBM Corp. 2013,2014. All Rights Reserved.
// US Government Users Restricted Rights - Use, duplication or
// disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
//-------------------------------------------------------------------------------

#import <Foundation/Foundation.h>

@interface IBMLogger : NSObject

+(void) logError: (NSString *)format, ...;
+(void) logWarning: (NSString*) format, ...;
+(void) logTrace: (NSString*) format, ...;
+(void) logDebug: (NSString*) format, ...;
+(NSInteger) getLogLevel;
+(void) setLogLevel: (NSInteger) newLevel;

#define LOG_LEVEL_ERROR 1
#define LOG_LEVEL_WARNING 2
#define LOG_LEVEL_TRACE 4
#define LOG_LEVEL_DEBUG 8

#define LOG_LEVEL_JSON_NAME_ERROR @"ERROR"
#define LOG_LEVEL_JSON_NAME_WARNING @"WARNING"
#define LOG_LEVEL_JSON_NAME_TRACE @"TRACE"
#define LOG_LEVEL_JSON_NAME_DEBUG @"DEBUG"

@end
