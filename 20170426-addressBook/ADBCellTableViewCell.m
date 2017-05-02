//
//  ADBCellTableViewCell.m
//  20170426-addressBook
//
//  Created by Admin on 27/04/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

#define AVATARAMARGIN 50
#import "ADBCellTableViewCell.h"
#import "ADBContact.h"
#import "ADBAvatar.h"
@import Masonry;
#include "UIKit/UIKit.h"

NSString *const CBContactCellIdentifier = @"CBContactCellIdentifier";

@interface ADBCellTableViewCell ()

@property(nonatomic, strong) UILabel *firstNameLabel;
@property(nonatomic, strong) UILabel *lastNameLabel;
@property(nonatomic, strong) ADBAvatar *avatarView;

@end

@implementation ADBCellTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _firstNameLabel = [UILabel new];
    _lastNameLabel = [UILabel new];
    _avatarView = [ADBAvatar new];
    
//    _avatarView.frame = CGRectMake(0, 0, 30, 50);

    [self addSubview:_firstNameLabel];
    [self addSubview:_lastNameLabel];
    [self addSubview:_avatarView];
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) addContactToCell: (ADBContact *) contact thiscontact:(NSUInteger) numContact of:(NSUInteger) countContacts {
    self.firstNameLabel.text = contact.firstName;
    [self.firstNameLabel sizeToFit];
    [self.firstNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([[NSNumber alloc] initWithInt:0]);
        make.left.equalTo([[NSNumber alloc] initWithInt:AVATARAMARGIN]);
    }];

    self.lastNameLabel.text = contact.lastName;
    [self.lastNameLabel sizeToFit];
    [self.lastNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.firstNameLabel.mas_bottom);
        make.left.equalTo([[NSNumber alloc] initWithInt:AVATARAMARGIN]);
    }];
    
    //генерация аватарки
    UIColor * color;
    color = [UIColor colorWithHue: [[NSNumber numberWithUnsignedInteger:numContact] floatValue]/[[NSNumber numberWithUnsignedInteger:countContacts] floatValue] saturation:1.0 brightness:1.0 alpha:1.0];
    
    UILabel *circleWithText = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 50.0, 50.0)];
    if ([contact.lastName isEqualToString:@""]) {
        circleWithText.text = [NSString stringWithFormat:@"%c", [contact.firstName characterAtIndex:0]];
    } else {
        circleWithText.text = [NSString stringWithFormat:@"%c%c", [contact.firstName characterAtIndex:0], [contact.lastName characterAtIndex:0]];
    }
    circleWithText.backgroundColor = color;
    circleWithText.textAlignment = NSTextAlignmentCenter;
    circleWithText.layer.masksToBounds = YES;
    circleWithText.layer.cornerRadius = CGRectGetWidth(circleWithText.frame)/2;
    [circleWithText setTextColor: [UIColor blackColor]];
    [_avatarView addSubview: circleWithText];
}

@end
