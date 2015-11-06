//
//  Ship.m
//  AFN_Demo
//
//  Created by Chuanxun on 15/11/5.
//  Copyright © 2015年 eLane. All rights reserved.
//

#import "Ship.h"

@implementation Ship

+(instancetype)shipWithDict:(NSDictionary *)dict
{
    Ship *ship = [Ship new];
    [ship setValuesForKeysWithDictionary:dict];
    
    return ship;
}

@end
