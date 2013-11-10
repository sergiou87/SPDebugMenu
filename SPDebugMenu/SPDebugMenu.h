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

- (id)initWithWindow:(UIWindow *)window;

- (void)registerTrigger:(id<SPDebugMenuTriggering>)trigger;
- (void)unregisterAllTriggers;

- (void)registerAction:(id<SPDebugMenuAction>)action;
- (void)unregisterAllActions;

@end
