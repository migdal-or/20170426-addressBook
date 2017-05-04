//
//  ADBTableViewController.m
//  20170426-addressBook
//
//  Created by Admin on 26/04/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "ADBTableViewController.h"
#import "ADBAddressBook.h"
#import "ADBBookLoader.h"
#import "ADBCellTableViewCell.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@import Masonry;

@interface ADBTableViewController ()

@property (nonatomic, strong) FBSDKLoginButton *loginButton;
@property (nonatomic, strong) UIButton *loadFromFacebook;
@property (nonatomic, strong) ADBAddressBook* addressBook;

@end

@implementation ADBTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    self.addressBook = [[ADBBookLoader new] LoadContactsFromStub];
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
//    
//    [self.tableView registerClass:[ADBCellTableViewCell class] forCellReuseIdentifier:	CBContactCellIdentifier];
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *authorizationLoadView = [UIView new];
    authorizationLoadView.frame = CGRectMake(20, 60, self.view.bounds.size.width - 40, 200);
    authorizationLoadView.backgroundColor = [UIColor colorWithRed:225.0/255 green:225.0/255 blue:225.0/255 alpha:1];
    [self.view addSubview:authorizationLoadView];
    
    UISegmentedControl *segmentedController = [[UISegmentedControl alloc] initWithItems: @[ @"facebookAuth", @"vkAuth" ] ];
    segmentedController.frame = CGRectMake(0, 0, authorizationLoadView.bounds.size.width, 40);
    segmentedController.backgroundColor = [UIColor colorWithRed:200.0/255 green:200.0/255 blue:200.0/255 alpha:1];
    [segmentedController addTarget:self action:@selector(segmentedValueChanged:) forControlEvents:UIControlEventValueChanged];
    segmentedController.selectedSegmentIndex = 0;
    [authorizationLoadView addSubview:segmentedController];
    
    _loginButton = [[FBSDKLoginButton alloc] init];
    _loginButton.delegate = self;
    _loginButton.frame = CGRectMake(50, 40, 30, 30);
    [_loginButton sizeToFit];
//    [_loginButton addTarget:self action:@selector(checkLoggedIn) forControlEvents:UIControlEventTouchUpInside];
    [authorizationLoadView addSubview:_loginButton];
    
    _loadFromFacebook = [UIButton new];
    [_loadFromFacebook setTitle:@"Load" forState:UIControlStateNormal];
    if ([FBSDKAccessToken currentAccessToken]) {
        _loadFromFacebook.hidden = NO;
    } else {
        _loadFromFacebook.hidden = YES;
    }
    _loadFromFacebook.frame = CGRectMake(120, 40, 30, 30);
    [_loadFromFacebook sizeToFit];
    _loadFromFacebook.backgroundColor = [UIColor redColor];
    [_loadFromFacebook addTarget:self action:@selector(loadFromFacebookButton) forControlEvents:UIControlEventTouchUpInside];
    [authorizationLoadView addSubview:_loadFromFacebook];
}

- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error{
    if ([FBSDKAccessToken currentAccessToken]) {
        _loadFromFacebook.hidden = NO;
    } else {
        _loadFromFacebook.hidden = YES;
    }
}

-(void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton{
//    NSLog(@"logged out");
//    if ([FBSDKAccessToken currentAccessToken]) {
//        _loadFromFacebook.hidden = NO;
//    } else {
        _loadFromFacebook.hidden = YES;
//    }
}


- (void)loadFromFacebookButton {
    NSLog(@"touched load");
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
        _loadFromFacebook.hidden = YES;
     //        NSLog(@"vk.com");
    }
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.addressBook count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = (ADBCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CBContactCellIdentifier forIndexPath:indexPath];
    
    if (nil == cell) {
        cell = [[ADBCellTableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier: CBContactCellIdentifier];
    }
    
    NSUInteger cellRow = indexPath.row;
    ADBContact * contactToAdd = (ADBContact *) [self.addressBook objectAtIndexedSubscript: cellRow];
    
    [(ADBCellTableViewCell *) cell addContactToCell: (ADBContact *) contactToAdd thiscontact: cellRow of: self.addressBook.count];
    
    [cell layer].borderWidth = 1.0f;
    
    return cell;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 50;
//}


@end
