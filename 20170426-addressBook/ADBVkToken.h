//
//  ADBVkToken.h
//  20170426-addressBook
//
//  Created by iOS-School-1 on 02.05.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADBVkToken : NSObject

+(nonnull NSString *)getToken;
+(void)saveTokenToDefaults:(nonnull NSString*) accessToken;
@end
