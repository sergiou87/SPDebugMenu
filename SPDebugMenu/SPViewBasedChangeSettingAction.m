//
//  SPViewBasedChangeSettingAction.m
//  SPDebugMenu
//
//  Created by Sergio Padrino on 17/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPViewBasedChangeSettingAction.h"

@implementation SPViewBasedChangeSettingAction

@synthesize delegate = _delegate;

- (NSString *)title
{
    return @"Change settings…";
}

- (NSString *)description
{
    return @"Pushes a view controller where you can change the settings.";
}

- (void)performActionWithNavigationController:(UINavigationController *)navigationController
                                   screenshot:(UIImage *)screenshot
{
    
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
