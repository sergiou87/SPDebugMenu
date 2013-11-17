//
//  SPDebugMenuShakeTrigger.h
//  SPDebugMenu
//
//  Created by Sergio Padrino on 10/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPDebugMenuTriggering.h"

/// Shake-based trigger for the debug menu.
@interface SPDebugMenuShakeTrigger : NSObject <SPDebugMenuTriggering>

/// Called by the view detecting the shake motion
- (void)shakeMotionInView:(UIView *)view;

@end
