//
//  SPSendReportAction.h
//  SPDebugMenu
//
//  Created by Sergio Padrino on 10/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPDebugMenuAction.h"

@protocol SPSendReportStatusComposing;

/// This debug action allows the user to send a report with the current state of the app
/// and a screenshot as attachment.
@interface SPSendReportAction : NSObject <SPDebugMenuAction>

/// Composer from which the action will get the information to send in the e-mail
@property (nonatomic, strong) id<SPSendReportStatusComposing> statusComposer;

@end
