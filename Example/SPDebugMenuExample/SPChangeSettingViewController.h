//
//  SPChangeSettingViewController.h
//  SPDebugMenu
//
//  Created by Sergio Padrino on 17/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SPExampleSettings;
@protocol SPChangeSettingViewControllerDelegate;

@interface SPChangeSettingViewController : UIViewController

@property (nonatomic, weak) id<SPChangeSettingViewControllerDelegate> delegate;

@property (nonatomic, strong) SPExampleSettings *settings;

@end

@protocol SPChangeSettingViewControllerDelegate <NSObject>

- (void)changeSettingViewControllerDidFinish:(SPChangeSettingViewController *)controller;

@end
