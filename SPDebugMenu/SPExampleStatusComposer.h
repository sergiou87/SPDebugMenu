//
//  SPExampleStatusComposer.h
//  SPDebugMenu
//
//  Created by Sergio Padrino on 16/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPSendReportStatusComposing.h"

#import "SPExampleSettings.h"

@interface SPExampleStatusComposer : NSObject <SPSendReportStatusComposing>

@property (nonatomic, strong) SPExampleSettings *settings;

@end
