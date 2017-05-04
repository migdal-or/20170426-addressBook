//
//  ADBBookLoader.h
//  20170426-addressBook
//
//  Created by Admin on 27/04/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "ADBAddressBook.h"
#import <Foundation/Foundation.h>

@interface ADBBookLoader : NSObject

-(ADBAddressBook*) LoadContactsFromStub;
-(ADBAddressBook*) LoadContactsFromVK;
-(ADBAddressBook*) LoadContactsFromFacebook;
@end
