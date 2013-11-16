//
//  SPSendReportAction.h
//  SPDebugMenu
//
//  Created by Sergio Padrino on 10/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPDebugMenuAction.h"

@protocol SPSendReportStatusGetting;

@interface SPSendReportAction : NSObject <SPDebugMenuAction>

@property (nonatomic, strong) id<SPSendReportStatusGetting> statusGetting;

@end
