//
//  CBViewController.m
//  20170426-addressBook
//
//  Created by Admin on 26/04/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "ADBViewController.h"
#import "ADBTableViewController.h"

@interface ADBViewController ()

@end

@implementation ADBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ADBTableViewController *tableVC = [ADBTableViewController new];
    self.viewControllers = @[tableVC];
}


@end
