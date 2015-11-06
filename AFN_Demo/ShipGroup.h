//
//  ShipGroup.h
//  AFN_Demo
//
//  Created by Chuanxun on 15/11/5.
//  Copyright © 2015年 eLane. All rights reserved.
//

#import <Foundation/Foundation.h>


@class Ship;

@interface ShipGroup : NSObject

@property (copy, nonatomic) NSString *GroupColor;
@property (copy, nonatomic) NSString *GroupId;
@property (copy, nonatomic) NSString *GroupName;
@property (strong, nonatomic) NSArray *Ships;

+ (instancetype)shipGroupWithDict:(NSDictionary *)dict;

@end
