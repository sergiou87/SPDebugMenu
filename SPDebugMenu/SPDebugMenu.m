//
//  SPDebugMenu.m
//  SPDebugMenu
//
//  Created by Sergio Padrino on 10/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPDebugMenu.h"

#import "SPDebugMenuTriggering.h"
#import "SPDebugMenuViewController.h"

#pragma mark - SPDebugMenu class extension

@interface SPDebugMenu () <SPDebugMenuTriggeringDelegate>

@property (nonatomic, weak) UIWindow *window;

@property (nonatomic, strong) NSMutableArray *triggers;
@property (nonatomic, strong) NSMutableArray *actions;

@end

#pragma mark - SPDebugMenu class implementation

@implementation SPDebugMenu

- (id)initWithWindow:(UIWindow *)window
{
    self = [super init];
    if (self)
    {
        _window = window;
        
        _triggers = [NSMutableArray array];
        _actions = [NSMutableArray array];
    }
    return self;
}

- (void)registerTrigger:(id<SPDebugMenuTriggering>)trigger
{
    trigger.delegate = self;
    [self.triggers addObject:trigger];
}

- (void)unregisterAllTriggers
{
    for (id<SPDebugMenuTriggering> trigger in self.triggers)
    {
        trigger.delegate = nil;
    }
    
    [self.triggers removeAllObjects];
}

- (void)registerAction:(id<SPDebugMenuAction>)action
{
    [self.actions addObject:action];
}

- (void)unregisterAllActions
{
    [self.actions removeAllObjects];
}

- (void)showDebugMenu
{
    SPDebugMenuViewController *viewController = [[SPDebugMenuViewController alloc] initWithDebugMenuActions:self.actions];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    [self.window.rootViewController presentViewController:navigationController
                                                 animated:YES
                                               completion:nil];
}

#pragma mark - SPDebugMenuTriggeringDelegate methods

- (void)debugMenuWasTriggered:(id<SPDebugMenuTriggering>)sender
{
    [self showDebugMenu];
}

@end
