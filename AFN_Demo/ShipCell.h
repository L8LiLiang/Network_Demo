//
//  ShipCell.h
//  AFN_Demo
//
//  Created by Chuanxun on 15/11/6.
//  Copyright © 2015年 eLane. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Ship;
@interface ShipCell : UITableViewCell
@property (strong, nonatomic) Ship *ship;

+ (instancetype)shipCellWithTableview:(UITableView *)tableView;
@end
