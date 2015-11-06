//
//  GroupCell.m
//  AFN_Demo
//
//  Created by Chuanxun on 15/11/6.
//  Copyright © 2015年 eLane. All rights reserved.
//

#import "GroupCell.h"
#import "ShipGroup.h"

@interface GroupCell()

@property (weak, nonatomic) IBOutlet UIView *ColorView;
@property (weak, nonatomic) IBOutlet UILabel *lblName;

@property (weak, nonatomic) IBOutlet UILabel *lblID;

@end


@implementation GroupCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    
    self.lblName.text = self.group.GroupName;
    self.lblID.text = self.group.GroupId;
    NSString *colorString = self.group.GroupColor;
    NSArray *colorArray = [colorString componentsSeparatedByString:@","];
    UIColor *color;
    if (colorArray.count == 3) {
        color = [UIColor colorWithRed:[colorArray[0] floatValue]/255.0 green:[colorArray[1] floatValue]/255.0 blue:[colorArray[2] floatValue]/255.0 alpha:1.0];
    }else {
        color = [UIColor clearColor];
    }
    self.ColorView.backgroundColor = color;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)groupCellWithTableview:(UITableView *)tableView
{
    GroupCell *cell = [tableView dequeueReusableCellWithIdentifier:@"group_cell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"GroupCell" owner:nil options:nil].firstObject;
    }
    return cell;
}

-(void)setGroup:(ShipGroup *)group
{
    _group = group;
    self.lblName.text = group.GroupName;
    self.lblID.text = group.GroupId;
    NSString *colorString = group.GroupColor;
    NSArray *colorArray = [colorString componentsSeparatedByString:@","];
    UIColor *color;
    if (colorArray.count == 3) {
        color = [UIColor colorWithRed:[colorArray[0] floatValue]/255.0 green:[colorArray[1] floatValue]/255.0 blue:[colorArray[2] floatValue]/255.0 alpha:1.0];
    }else {
        color = [UIColor clearColor];
    }
    self.ColorView.backgroundColor = color;
}

@end
