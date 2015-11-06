//
//  DemoHTTPSessionManager.m
//  AFN_Demo
//
//  Created by Chuanxun on 15/11/3.
//  Copyright © 2015年 eLane. All rights reserved.
//

#import "DemoHTTPSessionManager.h"

@implementation DemoHTTPSessionManager

+(instancetype)sharedManager
{
    static DemoHTTPSessionManager *sharedManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        sessionConfiguration.timeoutIntervalForRequest = 10;
        
        sharedManager = [[[self class] alloc] initWithBaseURL:nil sessionConfiguration:sessionConfiguration];
        sharedManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        
        sharedManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain" ,nil];
        
        NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:4 * 1024 * 1024 diskCapacity:20 * 1024 * 1024 diskPath:nil];
        [NSURLCache setSharedURLCache:URLCache];
        
    });
    return sharedManager;
}

@end
