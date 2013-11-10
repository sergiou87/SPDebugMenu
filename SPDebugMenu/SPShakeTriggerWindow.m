//
//  SPShakeTriggerWindow.m
//  SPDebugMenu
//
//  Created by Sergio Padrino on 10/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPShakeTriggerWindow.h"

#import "SPDebugMenuShakeTrigger.h"

@implementation SPShakeTriggerWindow

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    [super motionEnded:motion withEvent:event];
    
    if (motion == UIEventSubtypeMotionShake)
    {
        [self.shakeTrigger shakeMotionInWindow:self];
    }
}

@end
