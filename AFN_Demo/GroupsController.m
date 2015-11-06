//
//  GroupsController.m
//  AFN_Demo
//
//  Created by Chuanxun on 15/11/5.
//  Copyright © 2015年 eLane. All rights reserved.
//

#import "GroupsController.h"
#import "GroupCell.h"
#import "ShipCell.h"
#import "ShipGroup.h"
#import "Ship.h"




@interface GroupsController ()

@end

@implementation GroupsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.tableView registerClass:[GroupCell class] forCellReuseIdentifier:@"group_cell"];
//    [self.tableView registerClass:[ShipCell class] forCellReuseIdentifier:@"ship_cell"];
//    
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    ShipGroup *group = self.groups[section];
    return group.Ships.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    ShipCell *cell = [ShipCell shipCellWithTableview:tableView];
    
    ShipGroup *group = self.groups[indexPath.section];
    cell.ship = group.Ships[indexPath.row];
    
    return cell;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
//    GroupCell *cell = [GroupCell groupCellWithTableview:tableView];
//    cell.group = self.groups[section];
//    return cell;
    
    return [UIView new];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
