//
//  SPSendReportAction.m
//  SPDebugMenu
//
//  Created by Sergio Padrino on 10/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPSendReportAction.h"

#import <MessageUI/MessageUI.h>

#import "SPSendReportStatusGetting.h"

@interface SPSendReportAction () <MFMailComposeViewControllerDelegate>

@end

@implementation SPSendReportAction

@synthesize delegate = _delegate;

- (NSString *)title
{
    return @"Send report";
}

- (NSString *)description
{
    return @"Sends a report with a screenshot and information about the current status of the system.";
}

- (void)performActionWithNavigationController:(UINavigationController *)navigationController
                                   screenshot:(UIImage *)screenshot
{
    MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = self;
    [controller setSubject:@"App user report"];
    
    NSData *screenshotData = UIImageJPEGRepresentation(screenshot, 0.9f);
    [controller addAttachmentData:screenshotData mimeType:@"image/jpeg" fileName:@"screenshot.jpeg"];
    
    [controller setMessageBody:self.statusGetting.currentStatus isHTML:NO];
    if (controller)
    {
        [navigationController presentViewController:controller
                                           animated:YES
                                         completion:nil];
    }

    [self.delegate debugMenuActionDidStart:self];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error
{
    [controller.presentingViewController
     dismissViewControllerAnimated:YES
     completion:^{
         [self.delegate debugMenuActionDidEnd:self];
     }];
}

- (BOOL)shouldDismissDebugMenuAfterFinish
{
    return YES;
}

- (BOOL)shouldReloadDebugMenuAfterFinish
{
    return NO;
}

@end
