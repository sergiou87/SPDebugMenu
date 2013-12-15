//
//  SPSendReportAction.m
//  SPDebugMenu
//
//  Created by Sergio Padrino on 10/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPSendReportAction.h"

#import <MessageUI/MessageUI.h>

#import "SPSendReportStatusComposing.h"

@interface SPSendReportAction () <MFMailComposeViewControllerDelegate>

@property (nonatomic, strong) UIImage *screenshot;

@end

@implementation SPSendReportAction

@synthesize delegate = _delegate;

- (NSString *)title
{
    return @"Send report";
}

- (NSString *)detailedDescription
{
    return @"Sends a report with a screenshot and information about the current status of the system.";
}

- (void)prepare
{
    self.screenshot = [self takeScreenshot];
}

- (UIImage*)takeScreenshot
{
    // Create a graphics context with the target size
    // On iOS 4 and later, use UIGraphicsBeginImageContextWithOptions to take the scale into consideration
    // On iOS prior to 4, fall back to use UIGraphicsBeginImageContext
    CGSize imageSize = [[UIScreen mainScreen] bounds].size;
    if (NULL != UIGraphicsBeginImageContextWithOptions)
        UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    else
        UIGraphicsBeginImageContext(imageSize);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Iterate over every window from back to front
    for (UIWindow *window in [[UIApplication sharedApplication] windows])
    {
        if (![window respondsToSelector:@selector(screen)] || [window screen] == [UIScreen mainScreen])
        {
            // -renderInContext: renders in the coordinate space of the layer,
            // so we must first apply the layer's geometry to the graphics context
            CGContextSaveGState(context);
            // Center the context around the window's anchor point
            CGContextTranslateCTM(context, [window center].x, [window center].y);
            // Apply the window's transform about the anchor point
            CGContextConcatCTM(context, [window transform]);
            // Offset by the portion of the bounds left of and above the anchor point
            CGContextTranslateCTM(context,
                                  -[window bounds].size.width * [[window layer] anchorPoint].x,
                                  -[window bounds].size.height * [[window layer] anchorPoint].y);
            
            // Render the layer hierarchy to the current context
            [[window layer] renderInContext:context];
            
            // Restore the context
            CGContextRestoreGState(context);
        }
    }
    
    // Retrieve the screenshot image
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)performActionWithNavigationController:(UINavigationController *)navigationController
{
    MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = self;
    [controller setSubject:self.statusComposer.subject];
    
    [controller setToRecipients:self.statusComposer.defaultRecipients];
    
    NSData *screenshotData = UIImageJPEGRepresentation(self.screenshot, 0.9f);
    [controller addAttachmentData:screenshotData mimeType:@"image/jpeg" fileName:@"screenshot.jpeg"];
    
    [controller setMessageBody:self.statusComposer.currentStatus isHTML:NO];
    if (controller)
    {
        [navigationController presentViewController:controller
                                           animated:YES
                                         completion:nil];
    }

    [self.delegate debugMenuActionDidStart:self];
}

- (void)dispose
{
    self.screenshot = nil;
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
