//
//  GroupCell.h
//  AFN_Demo
//
//  Created by Chuanxun on 15/11/6.
//  Copyright © 2015年 eLane. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShipGroup;
@interface GroupCell : UITableViewCell
@property (strong, nonatomic) ShipGroup *group;

+(instancetype)groupCellWithTableview:(UITableView *)tableView;
@end
