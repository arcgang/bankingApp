//
//  IBMUriBuilder.h
//  IBMBaaS
//
//  Created by Kevan Holdaway on 3/27/14.
//  Copyright (c) 2014 International Business Machines. All rights reserved.
//

/** 
 Used to construct URI's by chaining together paths.  For example, 
 
 NSString *uri = [[[[IBMUriBuilder builder] append: segment1] slash] append: segment2] toString];
 
 uri would then be: "/segment1/segment2/"
 
 
 */
@interface IBMUriBuilder : NSObject

/** 
 @return returns a new instance of a IBMUriBuilder
 */
+(instancetype) builder;

/**
 @param path the path segment to be appended to the URI
 @return the IBMUriBuilder
 */
-(instancetype) append: (NSString*)path;

/**
 Adds a slash to the uri
 @return the IBMUriBuilder
 */
-(instancetype) slash;

/**
 @ The URI as a string
 */
@property (nonatomic, readonly) NSMutableString* uri;

@end
