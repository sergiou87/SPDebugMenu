// SPViewBasedChangeSettingAction.m
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


#import "SPViewBasedChangeSettingAction.h"

#import "SPChangeSettingViewController.h"

@interface SPViewBasedChangeSettingAction () <SPChangeSettingViewControllerDelegate>

@end

@implementation SPViewBasedChangeSettingAction

@synthesize delegate = _delegate;

- (NSString *)title
{
    return @"Change settings…";
}

- (NSString *)detailedDescription
{
    return @"Enable the magic from another view controller";
}

- (void)performActionWithNavigationController:(UINavigationController *)navigationController
{
    [self.delegate debugMenuActionDidStart:self];
    
    SPChangeSettingViewController *controller = [[SPChangeSettingViewController alloc] init];
    controller.delegate = self;
    controller.settings = self.settings;
    [navigationController pushViewController:controller animated:YES];
}

- (BOOL)shouldDismissDebugMenuAfterFinish
{
    return NO;
}

- (BOOL)shouldReloadDebugMenuAfterFinish
{
    return YES;
}

#pragma mark - SPChangeSettingViewControllerDelegate methods

- (void)changeSettingViewControllerDidFinish:(SPChangeSettingViewController *)controller
{
    [self.delegate debugMenuActionDidEnd:self];
}

@end
