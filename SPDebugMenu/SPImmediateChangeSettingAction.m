//
//  SPImmediateChangeSettingAction.m
//  SPDebugMenu
//
//  Created by Sergio Padrino on 17/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPImmediateChangeSettingAction.h"

#import "SPExampleSettings.h"

@implementation SPImmediateChangeSettingAction

@synthesize delegate = _delegate;

- (NSString *)title
{
    return [NSString stringWithFormat:@"Change setting (current value: %@)", self.settings.someSetting ? @"YES" : @"NO"];
}

- (NSString *)detailedDescription
{
    return @"Toggle setting value";
}

- (void)prepare
{
    // Do nothing
}

- (void)performActionWithNavigationController:(UINavigationController *)navigationController
{
    [self.delegate debugMenuActionDidStart:self];
    
    self.settings.someSetting = !self.settings.someSetting;
    
    [self.delegate debugMenuActionDidEnd:self];
}

- (void)dispose
{
    // Do nothing
}

- (BOOL)shouldDismissDebugMenuAfterFinish
{
    return NO;
}

- (BOOL)shouldReloadDebugMenuAfterFinish
{
    return YES;
}

@end
