//
//  SPDebugMenuAction.h
//  SPDebugMenu
//
//  Created by Sergio Padrino on 10/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SPDebugMenuActionDelegate;

@protocol SPDebugMenuAction <NSObject>

@property (nonatomic, weak) id<SPDebugMenuActionDelegate> delegate;

@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *description;

- (void)performActionWithNavigationController:(UINavigationController *)navigationController;

- (BOOL)shouldDismissDebugMenuAfterFinish;

@end

@protocol SPDebugMenuActionDelegate <NSObject>

- (void)debugMenuActionDidStart:(id<SPDebugMenuAction>)action;
- (void)debugMenuActionDidEnd:(id<SPDebugMenuAction>)action;

@end
