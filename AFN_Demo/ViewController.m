//
//  ViewController.m
//  AFN_Demo
//
//  Created by Chuanxun on 15/11/3.
//  Copyright © 2015年 eLane. All rights reserved.
//

#import "ViewController.h"
#import "DemoHTTPSessionManager.h"
#import <CommonCrypto/CommonCrypto.h>
#import "UserInfoController.h"
#import <UIKit+AFNetworking.h>
#import "UserAuthInfo.h"




#define LOGIN_URL_GET @"http://open.shipxy.com/auth/login?username=%@&password=%@&src=0&deviceid=%@"
#define LOGIN_URL_POST @"http://open.shipxy.com/auth/login"
#define WRONG_URL @"http://192.12.2.2"
#define AUTH_INFO_URL @"http://open.shipxy.com/auth/getauth?sid=%@"




@interface ViewController () <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *lblUserName;
@property (weak, nonatomic) IBOutlet UITextField *lblPassword;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UITextView *textViewErrorMsg;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIBarButtonItem *backButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Demo" style:UIBarButtonItemStylePlain target:self.navigationController action:@selector(popViewControllerAnimated:)];
    self.navigationItem.backBarButtonItem = backButtonItem;
    
    self.activityIndicator.hidden = YES;
}

- (IBAction)loginUseAFN:(id)sender {
    
    //NSString *strLoninUrl = [NSString stringWithFormat:LOGIN_URL,self.lblUserName.text,self.lblPassword.text,@"999999"];
    
    UIButton *btnSender = (UIButton *)sender;
    btnSender.enabled = NO;
    self.textViewErrorMsg.text = @"";
    
    DemoHTTPSessionManager *manager = [DemoHTTPSessionManager sharedManager];
    
    NSDictionary *params = @{@"username":self.lblUserName.text,@"password":self.lblPassword.text,@"deviceid":@"999999"};
    
    NSURLSessionDataTask *dataTask = [manager POST:LOGIN_URL_POST parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {

        NSDictionary *result = responseObject;
        int status = [[result objectForKey:@"status"] intValue];
        if (status == 0) {
            NSString *sid = [responseObject objectForKey:@"sid"];
            self.textViewErrorMsg.text =@"succeeded!\n开始获取权限信息...";
            
            NSString *urlString = [NSString stringWithFormat:AUTH_INFO_URL,sid];
            [manager GET:urlString parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
                
                UserAuthInfo *userInfo = [UserAuthInfo userAuthInfoWithDict:responseObject];
                userInfo.sid = sid;
                
                UserInfoController *userinfoCtrl = [[UserInfoController alloc] init];
                userinfoCtrl.userAuthInfo = userInfo;
                [self.navigationController pushViewController:userinfoCtrl animated:YES];
                
            } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
                NSLog(@"%@",error);
            }];
            
        }else
        {
            self.textViewErrorMsg.text = [NSString stringWithFormat:@"%@",result];
        }
        self.activityIndicator.hidden = YES;
        btnSender.enabled = YES;
        
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        AFNetworkReachabilityManager *networkRechabManager = [AFNetworkReachabilityManager sharedManager];
        if (!networkRechabManager.isReachable) {
            self.textViewErrorMsg.text = @"你的设备未连网.";
        }else
        {
            self.textViewErrorMsg.text = [NSString stringWithFormat:@"%@",error];
        }
        self.activityIndicator.hidden = YES;
        btnSender.enabled = YES;
    }];
    
    [self.activityIndicator setAnimatingWithStateOfTask:dataTask];
    self.activityIndicator.hidden = NO;
    
    [dataTask resume];
    
  
    
}



@end
