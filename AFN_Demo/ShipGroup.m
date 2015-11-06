//
//  ShipGroup.m
//  AFN_Demo
//
//  Created by Chuanxun on 15/11/5.
//  Copyright © 2015年 eLane. All rights reserved.
//

#import "ShipGroup.h"
#import "Ship.h"



@implementation ShipGroup

+(instancetype)shipGroupWithDict:(NSDictionary *)dict
{
    ShipGroup *group = [ShipGroup new];
    
    group.GroupColor = [dict valueForKey:@"GroupColor"];
    group.GroupId = [dict valueForKey:@"GroupId"];
    group.GroupName = [dict valueForKey:@"GroupName"];
    NSArray *shipTmp = [dict valueForKey:@"Ships"];
    NSMutableArray *ships = [[NSMutableArray alloc] initWithCapacity:[shipTmp count]];
    [shipTmp enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSDictionary class]]) {
            Ship *ship = [Ship shipWithDict:obj];
            [ships addObject:ship];
        }
    }];
    group.Ships = [ships copy];
    
    return group;
}

@end
