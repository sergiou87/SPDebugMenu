// SPExampleStatusComposer.m
//
// The MIT License (MIT)
//
// Copyright (c) 2014 Sergio Padrino
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


#import "SPExampleStatusComposer.h"

@implementation SPExampleStatusComposer

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
    [status appendFormat:@"Magic enabled: %@\n", self.settings.magicEnabled ? @"YES" : @"NO"];
    [status appendFormat:@"\n"];
    
    return [status copy];
}

- (NSString *)subject
{
    return @"App user report";
}

- (NSArray *)defaultRecipients
{
    return @[@"someone@mycompany.com", @"bugs@mycompany.com"];
}

@end
