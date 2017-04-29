//
//  ADBAddressBook.m
//  20170426-addressBook
//
//  Created by Admin on 27/04/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "ADBAddressBook.h"
#import "ADBContact.h"

@interface ADBAddressBook ()

@property(nonatomic, copy, readwrite) NSMutableArray *addressBook;

@end

@implementation ADBAddressBook

-(instancetype) initWithArray: (NSMutableArray<ADBContact *> * ) start {
    self = [super init];
    if (self) {
        _addressBook = start;
    }
    
    return self;
}

-(NSUInteger) count {
    return [self.addressBook count];
}

//-(void) addContactToBook: (ADBContact*) contactToAdd {
//    [self.addressBook addObject: contactToAdd];
//}

- (ADBContact *)objectAtIndexedSubscript:(NSUInteger)index {
    return self.addressBook[index];
}

@end

