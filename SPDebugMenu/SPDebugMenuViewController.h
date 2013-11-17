//
//  SPDebugMenuViewController.h
//  SPDebugMenu
//
//  Created by Sergio Padrino on 10/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SPDebugMenuViewControllerDelegate;

@interface SPDebugMenuViewController : UITableViewController

@property (nonatomic, weak) id<SPDebugMenuViewControllerDelegate> delegate;

- (instancetype)initWithDebugMenuActions:(NSArray *)actions
                              screenshot:(UIImage *)screenshot;

@end

@protocol SPDebugMenuViewControllerDelegate <NSObject>

- (void)debugMenuViewControllerDidFinish:(SPDebugMenuViewController *)controller;

@end
