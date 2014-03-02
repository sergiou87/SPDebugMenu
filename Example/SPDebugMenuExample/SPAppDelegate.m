// SPAppDelegate.m
//
// The MIT License (MIT)
//
// Copyright (c) 2014 Sergio Padrino
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


#import "SPAppDelegate.h"

#import "SPDebugMenu.h"
#import "SPDebugMenuLongPressTrigger.h"
#import "SPDebugMenuTapTrigger.h"
#import "SPDebugMenuShakeTrigger.h"
#import "SPExampleSettings.h"
#import "SPExampleStatusComposer.h"
#import "SPImmediateChangeSettingAction.h"
#import "SPShakeTriggerWindow.h"
#import "SPSimulateMemoryWarningAction.h"
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
    
    SPViewController *viewController = [[SPViewController alloc] initWithSettings:settings];
    self.window.rootViewController = viewController;
    
    // Configure the debug menu
    self.debugMenu = [[SPDebugMenu alloc] initWithWindow:self.window];

    // Configure a shake trigger (requires a ShakeTriggerWindow)
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
    
    // Configure an action to simulate a memory warning
    SPSimulateMemoryWarningAction *simulateMemoryWarningAction = [[SPSimulateMemoryWarningAction alloc] init];
    [self.debugMenu registerAction:simulateMemoryWarningAction];

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
