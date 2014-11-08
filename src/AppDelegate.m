//
//  AppDelegate.m
//  SimpleTest
//
//  Created by Maxime Austruy on 05/11/14.
//  Copyright (c) 2014 Maxime Austruy. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   NSLog(@"%s", __FUNCTION__);
   return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
      NSLog(@"%s", __FUNCTION__);
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
   NSLog(@"%s", __FUNCTION__);
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
   NSLog(@"%s", __FUNCTION__);
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
   NSLog(@"%s", __FUNCTION__);
}

- (void)applicationWillTerminate:(UIApplication *)application {
   NSLog(@"%s", __FUNCTION__);
}

@end
