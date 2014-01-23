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
    return [NSString stringWithFormat:@"Toggle magic (enabled: %@)", self.settings.magicEnabled ? @"YES" : @"NO"];
}

- (NSString *)detailedDescription
{
    return @"Toggle magic from here";
}

- (void)prepare
{
    // Do nothing
}

- (void)performActionWithNavigationController:(UINavigationController *)navigationController
{
    [self.delegate debugMenuActionDidStart:self];
    
    self.settings.magicEnabled = !self.settings.magicEnabled;
    
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
