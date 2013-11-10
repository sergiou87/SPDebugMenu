//
//  SPSendReportAction.m
//  SPDebugMenu
//
//  Created by Sergio Padrino on 10/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPSendReportAction.h"

#import <MessageUI/MessageUI.h>

@interface SPSendReportAction () <MFMailComposeViewControllerDelegate>

@end

@implementation SPSendReportAction

- (NSString *)title
{
    return @"Send report";
}

- (NSString *)description
{
    return @"Sends a report with a screenshot and information about the current status of the system.";
}

- (void)performActionWithNavigationController:(UINavigationController *)navigationController
{
    MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = self;
    [controller setSubject:@"App user report"];
    [controller setMessageBody:@"Hello there." isHTML:NO];
    if (controller)
    {
        [navigationController presentViewController:controller
                                           animated:YES
                                         completion:nil];
    }

}

- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error
{
    [controller.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
