//
//  AppDelegate.m
//  SimpleTest
//
//  Created by Maxime Austruy on 05/11/14.
//  Copyright (c) 2014 Maxime Austruy. All rights reserved.
//

#import "AppDelegate.h"
#import "app.h"

#include <sys/types.h>
#include <sys/uio.h>
#include <unistd.h>
#include <errno.h>

#include "bitc_ui.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

static void ReadEventCB(CFFileDescriptorRef fdref, CFOptionFlags callBackTypes, void *info)
{
   int data = 0;
   int res;
   int fd;
   
   fd = CFFileDescriptorGetNativeDescriptor(fdref);
   res = read(fd, &data, 1);
   if (res < 0) {
      printf("Failed to read ui fd: %d\n", errno);
   }
   
   CFFileDescriptorEnableCallBacks(fdref, kCFFileDescriptorReadCallBack);
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   CFFileDescriptorRef fdref;
   CFRunLoopSourceRef source;
   NSString *path;

   /* make sure cocoa knows we're multithreaded */
   [[NSThread new] start];

   path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
   path = [NSString stringWithFormat:@"%@/../", path ];
   path = [path stringByStandardizingPath];
   
   NSLog(@"%s: %@", __FUNCTION__, path);

   bitc_set_directory([path UTF8String]);
   bitc_app_init();

   fdref = CFFileDescriptorCreate(kCFAllocatorDefault, btcui->eventFd, false, ReadEventCB, NULL);
   CFFileDescriptorEnableCallBacks(fdref, kCFFileDescriptorReadCallBack);
   source = CFFileDescriptorCreateRunLoopSource(kCFAllocatorDefault, fdref, 0);
   CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
   CFRelease(source);
   
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
