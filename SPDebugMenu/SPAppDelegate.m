//
//  SPAppDelegate.m
//  SPDebugMenu
//
//  Created by Sergio Padrino on 10/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPAppDelegate.h"

#import "SPDebugMenu.h"
#import "SPDebugMenuShakeTrigger.h"
#import "SPShakeTriggerWindow.h"
#import "SPSendReportAction.h"
#import "SPViewController.h"

@interface SPAppDelegate ()

@property (nonatomic, strong) SPDebugMenu *debugMenu;

@end

@implementation SPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    SPDebugMenuShakeTrigger *trigger = [[SPDebugMenuShakeTrigger alloc] init];

    SPShakeTriggerWindow *shakeTriggerWindow = [[SPShakeTriggerWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    shakeTriggerWindow.shakeTrigger = trigger;
    self.window = shakeTriggerWindow;    

    self.debugMenu = [[SPDebugMenu alloc] initWithWindow:self.window];
    [self.debugMenu registerTrigger:trigger];
    
    [self.debugMenu registerAction:[[SPSendReportAction alloc] init]];

    SPViewController *viewController = [[SPViewController alloc] init];
    self.window.rootViewController = viewController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"jare");
}

@end
