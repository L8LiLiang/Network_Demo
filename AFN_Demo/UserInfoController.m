//
//  UserInfoController.m
//  AFN_Demo
//
//  Created by Chuanxun on 15/11/3.
//  Copyright © 2015年 eLane. All rights reserved.
//

#import "UserInfoController.h"
#import "UserAuthInfo.h"
#import "DemoHTTPSessionManager.h"
#import <UIKit+AFNetworking.h>
#import "ShipGroup.h"
#import "GroupsController.h"


#define USER_SHIP_URL @"http://open.shipxy.com/ship/getUserShips?sid=%@&type=%d"


@interface UserInfoController ()
@property (weak, nonatomic) IBOutlet UILabel *lblUserName;
@property (weak, nonatomic) IBOutlet UILabel *lblSID;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;
@property (weak, nonatomic) IBOutlet UILabel *lblMsg;
@property (weak, nonatomic) IBOutlet UILabel *lblServiceStatus;
@property (weak, nonatomic) IBOutlet UILabel *lblServiceType;
@property (weak, nonatomic) IBOutlet UILabel *lblNormalOrTry;
@property (weak, nonatomic) IBOutlet UILabel *lblEndTime;
@property (weak, nonatomic) IBOutlet UILabel *lblEndTimeMobile;
@property (weak, nonatomic) IBOutlet UILabel *lblKinShipMMSI;
@property (weak, nonatomic) IBOutlet UILabel *lblCustomShipName;
@property (weak, nonatomic) IBOutlet UILabel *lblServiceStatusMobile;
@property (weak, nonatomic) IBOutlet UILabel *lblDPlus;


@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation UserInfoController

-(void)setUserAuthInfo:(UserAuthInfo *)userAuthInfo
{
    _userAuthInfo = userAuthInfo;
    self.lblUserName.text = userAuthInfo.username;
    self.lblSID.text = userAuthInfo.sid;
    self.lblStatus.text = [NSString stringWithFormat:@"%zd",userAuthInfo.status];
    self.lblMsg.text = @"nil";
    self.lblServiceStatus.text = [NSString stringWithFormat:@"%zd",userAuthInfo.ServiceStatus];
    self.lblServiceType.text = [NSString stringWithFormat:@"%zd",userAuthInfo.ServiceType];
    self.lblNormalOrTry.text = [NSString stringWithFormat:@"%zd",userAuthInfo.NormalOrTry];
    self.lblEndTime.text = [NSString stringWithFormat:@"%@",userAuthInfo.EndTime];
    self.lblEndTimeMobile.text = [NSString stringWithFormat:@"%@",userAuthInfo.EndTime_Mobile];
    self.lblKinShipMMSI.text = userAuthInfo.KinshipMMSI;
    self.lblCustomShipName.text = userAuthInfo.CustomShipName;
    self.lblServiceStatusMobile.text = [NSString stringWithFormat:@"%zd",userAuthInfo.ServiceStatus_Mobile];
    self.lblDPlus.text = [NSString stringWithFormat:@"%zd",userAuthInfo.dplus];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.scrollView.contentSize = [UIScreen mainScreen].bounds.size;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    
    self.navigationItem.title = self.userAuthInfo.username;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    
    self.lblUserName.text = self.userAuthInfo.username;
    self.lblSID.text =  self.userAuthInfo.sid;
    self.lblStatus.text = [NSString stringWithFormat:@"%zd", self.userAuthInfo.status];
    self.lblMsg.text = @"nil";
    self.lblServiceStatus.text = [NSString stringWithFormat:@"%zd", self.userAuthInfo.ServiceStatus];
    self.lblServiceType.text = [NSString stringWithFormat:@"%zd", self.userAuthInfo.ServiceType];
    self.lblNormalOrTry.text = [NSString stringWithFormat:@"%zd", self.userAuthInfo.NormalOrTry];
    self.lblEndTime.text = [NSString stringWithFormat:@"%@", self.userAuthInfo.EndTime];
    self.lblEndTimeMobile.text = [NSString stringWithFormat:@"%@", self.userAuthInfo.EndTime_Mobile];
    self.lblKinShipMMSI.text =  self.userAuthInfo.KinshipMMSI;
    self.lblCustomShipName.text =  self.userAuthInfo.CustomShipName;
    self.lblServiceStatusMobile.text = [NSString stringWithFormat:@"%zd", self.userAuthInfo.ServiceStatus_Mobile];
    self.lblDPlus.text = [NSString stringWithFormat:@"%zd", self.userAuthInfo.dplus];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)downloadShipList:(id)sender {
    
    DemoHTTPSessionManager *manager = [DemoHTTPSessionManager sharedManager];
    NSString *urlString = [NSString stringWithFormat:USER_SHIP_URL,self.userAuthInfo.sid,0];
    
    NSURLSessionDataTask *task = [manager GET:urlString parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        NSDictionary *result = responseObject;
        int status = [[result objectForKey:@"status"] intValue];;
        if (status == 0) {
            NSArray *groups = [result objectForKey:@"data"];
            NSMutableArray *groupArray = [[NSMutableArray alloc] init];
            [groups enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                ShipGroup *group = [ShipGroup shipGroupWithDict:obj];
                [groupArray addObject:group];
            }];
            
            GroupsController *groupController = [[GroupsController alloc] initWithStyle:UITableViewStyleGrouped];
            groupController.groups = groupArray;
            
            [self.navigationController pushViewController:groupController animated:YES];
            
        }else
        {
            NSLog(@"status = %d\nmsg = %@",status,[result objectForKey:@"msg"]);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        if (![AFNetworkReachabilityManager sharedManager].reachable) {
            NSLog(@"你的设备未连接网络");
        }else {
            NSLog(@"%@",error);
        }
    }];
    
    [task resume];
    
}
- (IBAction)downloadAreaShip:(id)sender {
}



@end
