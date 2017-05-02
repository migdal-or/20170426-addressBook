//
//  AppDelegate.m
//  20170426-addressBook
//
//  Created by Admin on 26/04/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "AppDelegate.h"
#import "ADBTableViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "ADBAuthorizationChoiceController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    
    BOOL handled = [[FBSDKApplicationDelegate sharedInstance] application:application
                                                                  openURL:url
                                                        sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
                                                               annotation:options[UIApplicationOpenURLOptionsAnnotationKey]
                    ];
    // Add any custom logic here.
    return handled;
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    
    
    //    ADBViewController *navigationController = [[ADBViewController alloc] init];
    //    UIWindow *window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    //    window.rootViewController = navigationController;
    //    self.window = window;
    //    [window makeKeyAndVisible];
    
    UINavigationController *navigationController = [[UINavigationController alloc] init];
    UIWindow *window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    window.rootViewController = navigationController;
    
//    ADBTableViewController *tableVC = [ADBTableViewController new];
    ADBAuthorizationChoiceController *fbAuthorizationController = [ADBAuthorizationChoiceController new];
    
    navigationController.viewControllers = @[fbAuthorizationController];
    
    self.window = window;
    [window makeKeyAndVisible];

    return YES;
}



@end
