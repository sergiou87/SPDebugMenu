//
//  SPDebugMenu.h
//  SPDebugMenu
//
//  Created by Sergio Padrino on 10/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SPDebugMenuAction;
@protocol SPDebugMenuTriggering;

@interface SPDebugMenu : NSObject

/// Initializer with the window where the menu will be shown
- (id)initWithWindow:(UIWindow *)window;

/// Registers a trigger and sets itself as trigger's delegate
- (void)registerTrigger:(id<SPDebugMenuTriggering>)trigger;

/// Unregisters all triggers
- (void)unregisterAllTriggers;

/// Registers an action
- (void)registerAction:(id<SPDebugMenuAction>)action;

/// Unregisters all actions
- (void)unregisterAllActions;

@end
