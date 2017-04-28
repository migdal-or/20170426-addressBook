//
//  ADBAddressBook.m
//  20170426-addressBook
//
//  Created by Admin on 27/04/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "ADBAddressBook.h"
#import "ADBContact.h"

@implementation ADBAddressBook

-(instancetype) initWithArray: (NSMutableArray * ) start {
    self = [super init];
    _addressBook = start;
    return self;
}

-(void) addContactToBook: (ADBContact*) contactToAdd {
    [self.addressBook addObject: contactToAdd];
}

-(ADBContact *) objectAtIndex:(NSUInteger)index {
    return _addressBook[index];
}

- (ADBContact*)objectAtIndexedSubscript:(NSUInteger)index {
    return self.addressBook[index];
}

@end

