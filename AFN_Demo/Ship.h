//
//  Ship.h
//  AFN_Demo
//
//  Created by Chuanxun on 15/11/5.
//  Copyright © 2015年 eLane. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ship : NSObject

@property (copy, nonatomic) NSString *Extinfo;
@property (copy, nonatomic) NSString *Id;
@property (copy, nonatomic) NSString *Remark;
@property (copy, nonatomic) NSString *ShipId;
@property (copy, nonatomic) NSString *ShipName;

+ (instancetype)shipWithDict:(NSDictionary *)dict;

@end
