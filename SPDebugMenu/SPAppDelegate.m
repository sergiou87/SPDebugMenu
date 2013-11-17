//
//  SPAppDelegate.m
//  SPDebugMenu
//
//  Created by Sergio Padrino on 10/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPAppDelegate.h"

#import "SPDebugMenu.h"
#import "SPDebugMenuLongPressTrigger.h"
#import "SPDebugMenuTapTrigger.h"
#import "SPDebugMenuShakeTrigger.h"
#import "SPExampleSettings.h"
#import "SPExampleStatusComposer.h"
#import "SPImmediateChangeSettingAction.h"
#import "SPShakeTriggerWindow.h"
#import "SPSendReportAction.h"
#import "SPViewBasedChangeSettingAction.h"
#import "SPViewController.h"

@interface SPAppDelegate ()

@property (nonatomic, strong) SPDebugMenu *debugMenu;

@end

@implementation SPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    SPExampleSettings *settings = [[SPExampleSettings alloc] init];
    
    SPShakeTriggerWindow *shakeTriggerWindow = [[SPShakeTriggerWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window = shakeTriggerWindow;
    
    SPViewController *viewController = [[SPViewController alloc] init];
    self.window.rootViewController = viewController;
    
    // Configure the debug menu
    self.debugMenu = [[SPDebugMenu alloc] initWithWindow:self.window];

    // Configure a shake trigger (requires a ShakeTriggerWindow
    SPDebugMenuShakeTrigger *shakeTrigger = [[SPDebugMenuShakeTrigger alloc] init];
    shakeTriggerWindow.shakeTrigger = shakeTrigger;
    [self.debugMenu registerTrigger:shakeTrigger];
    
    // Configure a tap trigger (5 taps with 2 fingers)
    SPDebugMenuTapTrigger *tapTrigger = [[SPDebugMenuTapTrigger alloc] init];
    tapTrigger.view = self.window;
    tapTrigger.numberOfTouchesRequired = 2;
    tapTrigger.numberOfTapsRequired = 5;
    [self.debugMenu registerTrigger:tapTrigger];

    // Configure a long press trigger (with 2 fingers)
    SPDebugMenuLongPressTrigger *longPressTrigger = [[SPDebugMenuLongPressTrigger alloc] init];
    longPressTrigger.view = self.window;
    longPressTrigger.numberOfTouchesRequired = 2;
    [self.debugMenu registerTrigger:longPressTrigger];

    // Configure a "Send report" action
    SPExampleStatusComposer *statusComposer = [[SPExampleStatusComposer alloc] init];
    statusComposer.settings = settings;
    SPSendReportAction *sendReportAction = [[SPSendReportAction alloc] init];
    sendReportAction.statusComposer = statusComposer;
    [self.debugMenu registerAction:sendReportAction];

    // Configure an immediate change action
    SPImmediateChangeSettingAction *immediateChangeSettingAction = [[SPImmediateChangeSettingAction alloc] init];
    immediateChangeSettingAction.settings = settings;
    [self.debugMenu registerAction:immediateChangeSettingAction];
    
    // Configure a view-based change action
    SPViewBasedChangeSettingAction *viewBasedChangeSettingAction = [[SPViewBasedChangeSettingAction alloc] init];
    viewBasedChangeSettingAction.settings = settings;
    [self.debugMenu registerAction:viewBasedChangeSettingAction];

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

@end
