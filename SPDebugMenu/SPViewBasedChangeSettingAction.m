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

- (NSString *)description
{
    return @"Pushes a view controller where you can change the settings.";
}

- (void)performActionWithNavigationController:(UINavigationController *)navigationController
                                   screenshot:(UIImage *)screenshot
{
    [self.delegate debugMenuActionDidStart:self];
    
    SPChangeSettingViewController *controller = [[SPChangeSettingViewController alloc] init];
    controller.delegate = self;
    controller.settings = self.settings;
    [navigationController pushViewController:controller animated:YES];
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
