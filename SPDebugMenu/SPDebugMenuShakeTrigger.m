//
//  SPDebugMenuShakeTrigger.m
//  SPDebugMenu
//
//  Created by Sergio Padrino on 10/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPDebugMenuShakeTrigger.h"

@interface SPDebugMenuShakeTrigger ()

@end

@implementation SPDebugMenuShakeTrigger

@synthesize delegate = _delegate;

- (void)shakeMotionInView:(UIView *)view
{
    [self.delegate debugMenuWasTriggered:self];
}

@end
