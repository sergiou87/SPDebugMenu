//
//  SPDebugMenuShakeTrigger.h
//  SPDebugMenu
//
//  Created by Sergio Padrino on 10/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPDebugMenuTriggering.h"

@interface SPDebugMenuShakeTrigger : NSObject <SPDebugMenuTriggering>

- (void)shakeMotionInWindow:(UIWindow *)window;

@end
