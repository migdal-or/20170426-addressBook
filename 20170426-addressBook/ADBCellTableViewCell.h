//
//  ADBCellTableViewCell.h
//  20170426-addressBook
//
//  Created by Admin on 27/04/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADBAvatar.h"
#import "ADBContact.h"

extern NSString *const CBContactCellIdentifier;

@class ADBContact;

@interface ADBCellTableViewCell : UITableViewCell

//@property(nonatomic, strong) UILabel *firstNameLabel;
//@property(nonatomic, strong) UILabel *lastNameLabel;
//@property(nonatomic, strong) ADBAvatar *avatarView;

-(void) addContact: (ADBContact *) contact;
+ (CGFloat)heightForCell;
@end
