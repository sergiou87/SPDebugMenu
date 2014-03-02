//
//  SPSimulateMemoryWarningAction.m
//  SPDebugMenuExample
//
//  Created by Sergio Padrino on 02/03/14.
//  Copyright (c) 2014 Sergio Padrino. All rights reserved.
//

#import "SPSimulateMemoryWarningAction.h"

@implementation SPSimulateMemoryWarningAction

@synthesize delegate = _delegate;

- (NSString *)title
{
    return @"Simulate memory warning";
}

- (NSString *)detailedDescription
{
    return @"Simulates a memory warning notification.";
}

- (void)prepare
{

}

- (void)performActionWithNavigationController:(UINavigationController *)navigationController
{
    [self.delegate debugMenuActionDidStart:self];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    // This line uses a private method from UIApplication to simulate the memory warning. Although
    // using NSSelectorFromString is perfecly safe for publishing an app in the App Store,
    // it's better if you don't include this file in your binary for distribution.
    // Include this file at your own risk.
    [[UIApplication sharedApplication] performSelector:NSSelectorFromString(@"_performMemoryWarning")];
#pragma clang diagnostic pop
    
    [self.delegate debugMenuActionDidEnd:self];
}

- (void)dispose
{

}

- (BOOL)shouldDismissDebugMenuAfterFinish
{
    return YES;
}

- (BOOL)shouldReloadDebugMenuAfterFinish
{
    return NO;
}

@end
