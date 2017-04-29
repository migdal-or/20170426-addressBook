//
//  ADBBookLoader.m
//  20170426-addressBook
//
//  Created by Admin on 27/04/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "ADBBookLoader.h"
#import "ADBAddressBook.h"
#import "ADBContact.h"

@implementation ADBBookLoader

-(ADBAddressBook*) LoadContactsFromStub {
//    ADBAddressBook *book = [ADBAddressBook new];
    
    ADBContact * (^addContact)(NSString *, NSString *, NSString *, NSString *);
    addContact = ^ADBContact*(NSString *firstName, NSString *lastName, NSString *phoneNumber, NSString *email) {
        ADBContact * newContact = [ADBContact new];
        newContact.firstName = firstName;
        newContact.lastName = lastName;
        newContact.phoneNumber = phoneNumber;
        newContact.email = email;
        return newContact;
    };
    
    NSArray* stub = @[ addContact(@"n1Mivaequi",@"s1Tiboigee",@"+86469496458",@"Mivaequi.Tiboigee@gmail.com"),
                              addContact(@"n2phuwohdi",@"s2quinguos",@"+96896544346",@""                           ),
                              addContact(@"n3ahpaeshe",@"s3eekonoog",@"",            @"eekonoog@ojohchau.edu"      ),
                              addContact(@"n4uphohvak",@"s4soengaev",@"+29395987342",@"soengaev@ya.ru"             ),
                              addContact(@"n5agheepoo",@"s5kothaeka",@"+84628799628",@""                           ) ];
    
    return [[ADBAddressBook alloc] initWithArray: stub];
    
    
    //    [book addContactToBook: @[@"Mivaequi",@"Tiboigee",@"+86469496458",@"Mivaequi.Tiboigee@gmail.com"] ];
    //    [book addContactToBook: @[@"phuwohdi",@"quinguos",@"+96896544346",@""                           ] ];
    //    [book addContactToBook: @[@"ahpaeshe",@"eekonoog",@"",            @"eekonoog@ojohchau.edu"      ] ];
    //    [book addContactToBook: @[@"uphohvak",@"soengaev",@"+29395987342",@"soengaev@ya.ru"             ] ];
    //    [book addContactToBook: @[@"agheepoo",@"kothaeka",@"+84628799628",@""                           ] ];
    //
    //    return book;
    
}
@end
