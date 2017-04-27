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

@interface ADBTableViewController ()

@property (nonatomic, strong) ADBAddressBook* addressBook;
@end

@implementation ADBTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.addressBook = [[ADBBookLoader new] LoadContactsFromStub];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.addressBook.addressBook.count;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/


@end
