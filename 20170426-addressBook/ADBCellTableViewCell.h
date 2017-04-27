//
//  ADBCellTableViewCell.h
//  20170426-addressBook
//
//  Created by Admin on 27/04/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADBAvatar.h"

@interface ADBCellTableViewCell : UITableViewCell

@property(nonatomic, strong) UILabel *firstNameLabel;
@property(nonatomic, strong) UILabel *lastNameLabel;
@property(nonatomic, strong) ADBAvatar *avatarView;

@end
