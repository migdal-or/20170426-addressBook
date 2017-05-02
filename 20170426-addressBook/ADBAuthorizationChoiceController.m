//
//  ADBAuthorizationChoiceController.m
//  20170426-addressBook
//
//  Created by iOS-School-1 on 02/05/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "ADBAuthorizationChoiceController.h"
#import "ADBFbAuthorizationViewController.h"
#import "ADBVKAuthorizationController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
@import Masonry;

@interface ADBAuthorizationChoiceController ()

@property (nonatomic, strong) FBSDKButton *loginButton;
@property (nonatomic, strong) UIButton *loadFromFacebook;

@end

@implementation ADBAuthorizationChoiceController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    ADBFbAuthorizationViewController *facebookAuth = [ADBFbAuthorizationViewController new];
    //    ADBVKAuthorizationController *vkAuth = [ADBVKAuthorizationController new];
    
    UISegmentedControl *segmentedController = [[UISegmentedControl alloc] initWithItems: @[ @"facebookAuth", @"vkAuth" ] ];
    segmentedController.frame = CGRectMake(0, 60, self.view.bounds.size.width, 40);
    [segmentedController addTarget:self action:@selector(segmentedValueChanged:) forControlEvents:UIControlEventValueChanged];
    segmentedController.selectedSegmentIndex = 0;
    [self.view addSubview:segmentedController];
    
    _loginButton = [[FBSDKLoginButton alloc] init];
    _loginButton.center = self.view.center;
//    _loginButton.hidden = YES;
    [self.view addSubview:_loginButton];

    _loadFromFacebook = [UIButton new];
    [_loadFromFacebook setTitle:@"Load" forState:UIControlStateNormal];
    [_loadFromFacebook sizeToFit];
    [_loadFromFacebook mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginButton.mas_bottom).with.offset(30);
        make.left.equalTo(self.loginButton.mas_left);
    }];
    [self.view addSubview:_loadFromFacebook];
    
    [NSLayoutConstraint activateConstraints:self.view.constraints];
}

- (void)segmentedValueChanged:(UISegmentedControl *)segment {
    
    if(segment.selectedSegmentIndex == 0) {
        // открыли вкладку facebook
        _loginButton.hidden = NO;
        if ([FBSDKAccessToken currentAccessToken]) {
            _loadFromFacebook.hidden = NO;
        }
        
//        NSLog(@"fb.me");
        // next see at https://developers.facebook.com/docs/facebook-login/ios
    } else if (segment.selectedSegmentIndex == 1) {
        //открыли вкладку vk
        _loginButton.hidden = YES;
//        NSLog(@"vk.com");
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
