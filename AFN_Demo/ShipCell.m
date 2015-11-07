//
//  ShipCell.m
//  AFN_Demo
//
//  Created by Chuanxun on 15/11/6.
//  Copyright © 2015年 eLane. All rights reserved.
//

#import "ShipCell.h"
#import "Ship.h"


@interface ShipCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageViewImage;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblShipID;

@property (weak, nonatomic) IBOutlet UILabel *lblID;

@end



@implementation ShipCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    
//    self.lblName.text = self.ship.ShipName;
//    self.lblShipID.text = self.ship.ShipId;
//    self.lblID.text = self.ship.Id;
//    UIImage *image = [UIImage imageNamed:@"120"];
//    self.imageViewImage.image = image;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)shipCellWithTableview:(UITableView *)tableView
{
    ShipCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ship_cell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"ShipCell" owner:nil options:nil].firstObject;
    }
    return cell;
}

-(void)setShip:(Ship *)ship
{
    _ship = ship;
//    self.lblName.text = ship.ShipName;
//    self.lblShipID.text = ship.ShipId;
//    self.lblID.text = ship.Id;
    self.lblName.text = [NSString stringWithFormat:@"%@",ship.ShipName];
    self.lblShipID.text = [NSString stringWithFormat:@"%@",ship.ShipId];
    self.lblID.text = [NSString stringWithFormat:@"%@",ship.Id];
    
    UIImage *image = [UIImage imageNamed:@"120"];
    self.imageViewImage.image = image;
}

@end
