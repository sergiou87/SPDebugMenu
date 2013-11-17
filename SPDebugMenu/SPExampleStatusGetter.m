//
//  SPExampleStatusGetter.m
//  SPDebugMenu
//
//  Created by Sergio Padrino on 16/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPExampleStatusGetter.h"

@implementation SPExampleStatusGetter

- (NSString *)currentStatus
{
    NSMutableString *status = [NSMutableString string];
    
    // Device info
    UIDevice *currentDevice = [UIDevice currentDevice];
    [status appendFormat:@"DEVICE INFO\n"];
    [status appendFormat:@"Device model: %@\n", currentDevice.model];
    [status appendFormat:@"System name: %@\n", currentDevice.systemName];
    [status appendFormat:@"System version: %@\n", currentDevice.systemVersion];
    [status appendFormat:@"\n"];
    
    // App info
    [status appendFormat:@"APP STATUS\n"];
    [status appendFormat:@"Setting enabled: %@\n", self.settings.someSetting ? @"YES" : @"NO"];
    [status appendFormat:@"\n"];
    
    return [status copy];
}

@end
