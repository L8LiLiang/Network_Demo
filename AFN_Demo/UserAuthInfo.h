//
//  UserAuthInfo.h
//  AFN_Demo
//
//  Created by Chuanxun on 15/11/5.
//  Copyright © 2015年 eLane. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserAuthInfo : NSObject

@property (copy, nonatomic) NSString *CustomShipName;
@property (copy, nonatomic) NSDate *EndTime;
@property (copy, nonatomic) NSDate *EndTime_Mobile;
@property (copy, nonatomic) NSString *KinshipMMSI;
@property (assign, nonatomic) NSInteger NormalOrTry;
@property (assign, nonatomic) NSInteger ServiceStatus;
@property (assign, nonatomic) NSInteger ServiceStatus_Mobile;
@property (assign, nonatomic) NSInteger ServiceType;
@property (assign, nonatomic) NSInteger dplus;
@property (assign, nonatomic) NSInteger status;
@property (copy, nonatomic) NSString *username;

@property (copy, nonatomic) NSString *sid;


+ (instancetype)userAuthInfoWithDict:(NSDictionary *)dict;

@end
