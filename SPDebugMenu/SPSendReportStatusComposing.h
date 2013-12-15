//
//  SPSendReportStatusComposing.h
//  SPDebugMenu
//
//  Created by Sergio Padrino on 16/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import <Foundation/Foundation.h>

/// Classes conforming this protocol will be able to create the state of the app string
/// that will be send in the "Send report" debug action.
@protocol SPSendReportStatusComposing <NSObject>

/// App status string
- (NSString *)currentStatus;

/// Subject of the report to be sent
- (NSString *)subject;

// Default recipients of the report to be sent
- (NSArray *)defaultRecipients;

@end
