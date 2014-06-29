//
//  JSONWrapper.h
//  fromography
//
//  Created by Archan Ganguly on 5/17/13.
//
//

#import <Foundation/Foundation.h>

@interface JSONWrapper : NSObject

+ (void)performRequestWithUri:(NSString *)requestUri params:(NSDictionary *)params completionHandler:(void (^)(NSDictionary *, NSError *))completionBlock;

+ (void)performRequestWithUri:(NSString *)requestUri completionHandler:(void (^)(NSDictionary *, NSError *))completionBlock;

@end
