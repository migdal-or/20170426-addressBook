//
//  ADBContact.h
//  20170426-addressBook
//
//  Created by Admin on 27/04/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADBContact : NSObject

@property (nonatomic, copy) NSString * firstName;   //should not be empty
@property (nonatomic, copy) NSString * lastName;    //should not be empty
@property (nonatomic, copy) NSString * phoneNumber;
@property (nonatomic, copy) NSString * email;

@end
