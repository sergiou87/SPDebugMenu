//
//  SPDebugMenuTriggering.h
//  SPDebugMenu
//
//  Created by Sergio Padrino on 10/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SPDebugMenuTriggeringDelegate;

/// Classes implementing this protocol represent triggers of the debug menu. Examples:
/// shaking the device, performing long press somewhere, etc.
/// When the trigger receives its specific action, it informs its delegate.
@protocol SPDebugMenuTriggering <NSObject>

@property (nonatomic, weak) id<SPDebugMenuTriggeringDelegate> delegate;

@end

/// Trigger delegate
@protocol SPDebugMenuTriggeringDelegate <NSObject>

/// Method called when the triggering action occurs
- (void)debugMenuWasTriggered:(id<SPDebugMenuTriggering>)sender;

@end
