//
//  SPDebugMenuAction.h
//  SPDebugMenu
//
//  Created by Sergio Padrino on 10/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SPDebugMenuActionDelegate;

/// Classes conforming this protocol represents actions that can be done within the debug menu.
@protocol SPDebugMenuAction <NSObject>

@property (nonatomic, weak) id<SPDebugMenuActionDelegate> delegate;

/// A title to show in the debug menu
@property (nonatomic, readonly, copy) NSString *title;

/// A description to show in the debug menu
@property (nonatomic, readonly, copy) NSString *detailedDescription;

/// This method will be called when the debug menu is about to be shown. If your action requires
/// some work before the menu is actually shown, this is the place to do it. Example: taking a
/// screenshot of the app.
- (void)prepare;

/// This is where the action does its actual work. It can show new view controllers through
/// the navigation controller.
- (void)performActionWithNavigationController:(UINavigationController *)navigationController;

/// This method is called right before dismissing the debug menu. Its purpose is doing any
/// "disposing work" (like freeing that screenshot you took in the 'prepare' method).
- (void)dispose;

/// Flag indicating wether or not the debug menu should be dismissed after this action finishes
- (BOOL)shouldDismissDebugMenuAfterFinish;

/// Flag indicating wether or not the debug menu should be refreshed after this action finishes
- (BOOL)shouldReloadDebugMenuAfterFinish;

@end

/// Action delegate
@protocol SPDebugMenuActionDelegate <NSObject>

/// Called when the action starts
- (void)debugMenuActionDidStart:(id<SPDebugMenuAction>)action;

/// Called when the action ends
- (void)debugMenuActionDidEnd:(id<SPDebugMenuAction>)action;

@end
