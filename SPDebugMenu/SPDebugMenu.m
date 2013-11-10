//
//  SPDebugMenu.m
//  SPDebugMenu
//
//  Created by Sergio Padrino on 10/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPDebugMenu.h"

#import "SPDebugMenuAction.h"
#import "SPDebugMenuTriggering.h"
#import "SPDebugMenuViewController.h"

#pragma mark - SPDebugMenu class extension

@interface SPDebugMenu () <
    SPDebugMenuTriggeringDelegate,
    SPDebugMenuActionDelegate
>

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
    action.delegate = self;
    [self.actions addObject:action];
}

- (void)unregisterAllActions
{
    for (id<SPDebugMenuAction> action in self.actions)
    {
        action.delegate = nil;
    }
    
    [self.actions removeAllObjects];
}

- (void)showDebugMenu
{
    UIImage *screenshot = [self takeScreenshot];

    SPDebugMenuViewController *viewController = [[SPDebugMenuViewController alloc] initWithDebugMenuActions:self.actions
                                                                                                 screenshot:screenshot];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    [self.window.rootViewController presentViewController:navigationController
                                                 animated:YES
                                               completion:nil];
}

- (UIImage*)takeScreenshot
{
    // Create a graphics context with the target size
    // On iOS 4 and later, use UIGraphicsBeginImageContextWithOptions to take the scale into consideration
    // On iOS prior to 4, fall back to use UIGraphicsBeginImageContext
    CGSize imageSize = [[UIScreen mainScreen] bounds].size;
    if (NULL != UIGraphicsBeginImageContextWithOptions)
        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    else
        UIGraphicsBeginImageContext(imageSize);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Iterate over every window from back to front
    for (UIWindow *window in [[UIApplication sharedApplication] windows])
    {
        if (![window respondsToSelector:@selector(screen)] || [window screen] == [UIScreen mainScreen])
        {
            // -renderInContext: renders in the coordinate space of the layer,
            // so we must first apply the layer's geometry to the graphics context
            CGContextSaveGState(context);
            // Center the context around the window's anchor point
            CGContextTranslateCTM(context, [window center].x, [window center].y);
            // Apply the window's transform about the anchor point
            CGContextConcatCTM(context, [window transform]);
            // Offset by the portion of the bounds left of and above the anchor point
            CGContextTranslateCTM(context,
                                  -[window bounds].size.width * [[window layer] anchorPoint].x,
                                  -[window bounds].size.height * [[window layer] anchorPoint].y);
            
            // Render the layer hierarchy to the current context
            [[window layer] renderInContext:context];
            
            // Restore the context
            CGContextRestoreGState(context);
        }
    }
    
    // Retrieve the screenshot image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - SPDebugMenuTriggeringDelegate methods

- (void)debugMenuWasTriggered:(id<SPDebugMenuTriggering>)sender
{
    [self showDebugMenu];
}

#pragma mark - SPDebugMenuActionDelegate methods

- (void)debugMenuActionDidStart:(id<SPDebugMenuAction>)action
{
    
}

- (void)debugMenuActionDidEnd:(id<SPDebugMenuAction>)action
{
    if ([action shouldDismissDebugMenuAfterFinish])
    {
        [self.window.rootViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
