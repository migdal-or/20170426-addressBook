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

@property (nonatomic, strong) FBSDKButton *loginButton;
@property (nonatomic, strong) UIButton *loadFromFacebook;
@property (nonatomic, strong) ADBAddressBook* addressBook;

@end

@implementation ADBTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // segment control
    // uiseg
    
    UISegmentedControl *segmentedController = [[UISegmentedControl alloc] initWithItems: @[ @"facebookAuth", @"vkAuth" ] ];
    segmentedController.frame = CGRectMake(0, 60, self.view.bounds.size.width, 40);
    [segmentedController addTarget:self action:@selector(segmentedValueChanged:) forControlEvents:UIControlEventValueChanged];
    segmentedController.selectedSegmentIndex = 0;
    [self.view addSubview:segmentedController];
    
    _loginButton = [[FBSDKLoginButton alloc] init];
//    _loginButton.center = self.view.center;
    _loginButton.frame = CGRectMake(0, self.view.bounds.size.height / 2, 100, 100);
    [_loginButton sizeToFit];
//    _loginButton.hidden = YES;    // works in a strange way?
    [self.view addSubview:_loginButton];
    
    _loadFromFacebook = [UIButton new];
    [_loadFromFacebook setTitle:@"Load" forState:UIControlStateNormal]; // does not appear?
    [_loadFromFacebook sizeToFit];
    _loadFromFacebook.frame = CGRectMake(10, 60 + self.view.bounds.size.height / 2, 50, 50);
    _loadFromFacebook.backgroundColor = [UIColor redColor];
//    [_loadFromFacebook mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.loginButton.mas_bottom).with.offset(30);
//        make.left.equalTo(self.loginButton.mas_left);
//    }];
//    [NSLayoutConstraint activateConstraints:self.view.constraints];

    [self.view addSubview:_loadFromFacebook];
    
//    self.addressBook = [[ADBBookLoader new] LoadContactsFromStub];
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
//    
//    [self.tableView registerClass:[ADBCellTableViewCell class] forCellReuseIdentifier:	CBContactCellIdentifier];
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}


@end
