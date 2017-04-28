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

@interface ADBTableViewController ()

@property (nonatomic, strong) ADBAddressBook* addressBook;
@end

@implementation ADBTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.addressBook = [[ADBBookLoader new] LoadContactsFromStub];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[ADBCellTableViewCell class] forCellReuseIdentifier:	CBContactCellIdentifier];
    
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.addressBook.addressBook.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = (ADBCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CBContactCellIdentifier forIndexPath:indexPath];
    
    if (nil == cell) {
        cell = [[ADBCellTableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier: CBContactCellIdentifier];
    }
    
    [(ADBCellTableViewCell *) cell addContact: [self.addressBook objectAtIndex: indexPath.row]];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}


@end
