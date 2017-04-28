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
        ADBAddressBook *book = [ADBAddressBook new];

    NSMutableArray* stub = @[ @[@"Mivaequi",@"Tiboigee",@"+86469496458",@"Mivaequi.Tiboigee@gmail.com"],
                              @[@"phuwohdi",@"quinguos",@"+96896544346",@""                           ],
                              @[@"ahpaeshe",@"eekonoog",@"",            @"eekonoog@ojohchau.edu"      ],
                              @[@"uphohvak",@"soengaev",@"+29395987342",@"soengaev@ya.ru"             ],
                              @[@"agheepoo",@"kothaeka",@"+84628799628",@""                           ] ];
    
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
