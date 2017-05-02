//
//  ADBVkToken.m
//  20170426-addressBook
//
//  Created by iOS-School-1 on 02.05.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "ADBVkToken.h"

static NSString *const VKTokenDefaultName = @"VK token";

@implementation ADBVkToken

+(NSString *)getToken {
    return [[NSUserDefaults standardUserDefaults] objectForKey: VKTokenDefaultName];
}

+(void)saveTokenToDefaults:(nonnull NSString*) accessToken {
    if ([@"" isEqualToString: accessToken]) {
        NSLog(@"Tried to save empty VK access token to defaults");
        return;
    }
    [[NSUserDefaults standardUserDefaults] setObject:accessToken forKey:VKTokenDefaultName];
}
@end


// facebook app id 826855570794991
