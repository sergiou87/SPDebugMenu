//
//  SPViewBasedChangeSettingAction.m
//  SPDebugMenu
//
//  Created by Sergio Padrino on 17/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPViewBasedChangeSettingAction.h"

#import "SPChangeSettingViewController.h"

@interface SPViewBasedChangeSettingAction () <SPChangeSettingViewControllerDelegate>

@end

@implementation SPViewBasedChangeSettingAction

@synthesize delegate = _delegate;

- (NSString *)title
{
    return @"Change settings…";
}

- (NSString *)detailedDescription
{
    return @"Enable the magic from another view controller";
}

- (void)prepare
{
    // Do nothing
}

- (void)performActionWithNavigationController:(UINavigationController *)navigationController
{
    [self.delegate debugMenuActionDidStart:self];
    
    SPChangeSettingViewController *controller = [[SPChangeSettingViewController alloc] init];
    controller.delegate = self;
    controller.settings = self.settings;
    [navigationController pushViewController:controller animated:YES];
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

#pragma mark - SPChangeSettingViewControllerDelegate methods

- (void)changeSettingViewControllerDidFinish:(SPChangeSettingViewController *)controller
{
    [self.delegate debugMenuActionDidEnd:self];
}

@end
