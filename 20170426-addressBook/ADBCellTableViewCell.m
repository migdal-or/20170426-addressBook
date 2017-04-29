//
//  ADBCellTableViewCell.m
//  20170426-addressBook
//
//  Created by Admin on 27/04/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "ADBCellTableViewCell.h"
#import "ADBContact.h"
#import "ADBAvatar.h"

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
    
    _firstNameLabel.frame = CGRectMake(30, 0, 50, 20);
    _lastNameLabel.frame = CGRectMake(30, 25, 50, 50);
    _avatarView.frame = CGRectMake(0, 0, 30, 50);

    [self addSubview:_firstNameLabel];
    [self addSubview:_lastNameLabel];
    [self addSubview:_avatarView];
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) addContact: (ADBContact *) contact {
    
    self.firstNameLabel.text = contact.firstName;
    self.lastNameLabel.text = contact.lastName;
    
//    self.firstNameLabel.text = contact[0];  //адов костыль
//    [self.firstNameLabel sizeToFit];
//    self.lastNameLabel.text = contact[1];   //из-за того что не заимплементили интерфейс адресбука как сказал Лёша
//    [self.lastNameLabel sizeToFit];
    //сюда надо дописать генерацию аватарки
}

+ (CGFloat)heightForCell {
    return 80;
}

@end
