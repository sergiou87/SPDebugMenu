// SPDebugMenuAction.h
//
// The MIT License (MIT)
//
// Copyright (c) 2014 Sergio Padrino
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


#import <UIKit/UIKit.h>

@protocol SPDebugMenuActionDelegate;

/// Classes conforming this protocol represents actions that can be done within the debug menu.
@protocol SPDebugMenuAction <NSObject>

@property (nonatomic, weak) id<SPDebugMenuActionDelegate> delegate;

/// A title to show in the debug menu
@property (nonatomic, readonly, copy) NSString *title;

/// A description to show in the debug menu
@property (nonatomic, readonly, copy) NSString *detailedDescription;

/// This is where the action does its actual work. It can show new view controllers through
/// the navigation controller.
- (void)performActionWithNavigationController:(UINavigationController *)navigationController;

/// Flag indicating wether or not the debug menu should be dismissed after this action finishes
- (BOOL)shouldDismissDebugMenuAfterFinish;

/// Flag indicating wether or not the debug menu should be refreshed after this action finishes
- (BOOL)shouldReloadDebugMenuAfterFinish;

@optional

/// This method will be called when the debug menu is about to be shown. If your action requires
/// some work before the menu is actually shown, this is the place to do it. Example: taking a
/// screenshot of the app.
- (void)prepare;

/// This method is called right before dismissing the debug menu. Its purpose is doing any
/// "disposing work" (like freeing that screenshot you took in the 'prepare' method).
- (void)dispose;

@end

/// Action delegate
@protocol SPDebugMenuActionDelegate <NSObject>

/// Called when the action starts
- (void)debugMenuActionDidStart:(id<SPDebugMenuAction>)action;

/// Called when the action ends
- (void)debugMenuActionDidEnd:(id<SPDebugMenuAction>)action;

@end
