//
//  UserAuthInfo.m
//  AFN_Demo
//
//  Created by Chuanxun on 15/11/5.
//  Copyright © 2015年 eLane. All rights reserved.
//

#import "UserAuthInfo.h"

@implementation UserAuthInfo

//@property (copy, nonatomic) NSString *CustomShipName;
//@property (copy, nonatomic) NSDate *EndTime;
//@property (copy, nonatomic) NSDate *EndTime_Mobile;
//@property (copy, nonatomic) NSString *KinshipMMSI;
//@property (assign, nonatomic) NSInteger NormalOrTry;
//@property (assign, nonatomic) NSInteger ServiceStatus;
//@property (assign, nonatomic) NSInteger ServiceStatus_Mobile;
//@property (assign, nonatomic) NSInteger ServiceType;
//@property (assign, nonatomic) NSInteger dplus;
//@property (assign, nonatomic) NSInteger status;
//@property (copy, nonatomic) NSString *username;

+ (instancetype)userAuthInfoWithDict:(NSDictionary *)dict
{
    UserAuthInfo *obj = [UserAuthInfo new];
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}


@end
