//
//  SPDebugMenuTapTrigger.h
//  SPDebugMenu
//
//  Created by Sergio Padrino on 16/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPDebugMenuTriggering.h"

/// Tap based trigger for the debug menu. You can configure the number of taps
/// and touches required to trigger.
@interface SPDebugMenuTapTrigger : NSObject <SPDebugMenuTriggering>

/// View that has to be tapped to trigger
@property (nonatomic, strong) UIView *view;

@property (nonatomic) NSUInteger numberOfTapsRequired;
@property (nonatomic) NSUInteger numberOfTouchesRequired;

@end
