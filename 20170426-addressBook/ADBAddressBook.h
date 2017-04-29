//
//  ADBAddressBook.h
//  20170426-addressBook
//
//  Created by Admin on 27/04/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADBContact.h"

@class ADBContact;

@interface ADBAddressBook : NSObject

//@property (nonatomic, copy) NSMutableArray * addressBook;

-(instancetype) initWithArray: (NSMutableArray *) starts;
-(ADBContact *) objectAtIndexedSubscript: (NSUInteger) index;
-(NSUInteger) count;

@end
