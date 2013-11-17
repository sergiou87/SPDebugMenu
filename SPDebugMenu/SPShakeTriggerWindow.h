//
//  SPShakeTriggerWindow.h
//  SPDebugMenu
//
//  Created by Sergio Padrino on 10/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SPDebugMenuShakeTrigger;

/// This subclass of UIWindow can send shake notifications to a shake trigger.
/// Useful in debug to show the debug menu with a shake motion.
@interface SPShakeTriggerWindow : UIWindow

@property (nonatomic, strong) SPDebugMenuShakeTrigger *shakeTrigger;

@end
