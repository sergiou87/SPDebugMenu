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

- (NSString *)description
{
    return @"Toggle setting value";
}

- (void)performActionWithNavigationController:(UINavigationController *)navigationController
                                   screenshot:(UIImage *)screenshot
{
    [self.delegate debugMenuActionDidStart:self];
    
    self.settings.someSetting = !self.settings.someSetting;
    
    [self.delegate debugMenuActionDidEnd:self];
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
