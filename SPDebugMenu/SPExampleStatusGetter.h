//
//  SPExampleStatusGetter.h
//  SPDebugMenu
//
//  Created by Sergio Padrino on 16/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPSendReportStatusGetting.h"

#import "SPExampleSettings.h"

@interface SPExampleStatusGetter : NSObject <SPSendReportStatusGetting>

@property (nonatomic, strong) SPExampleSettings *settings;

@end
