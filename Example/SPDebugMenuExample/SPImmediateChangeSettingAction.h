//
//  SPImmediateChangeSettingAction.h
//  SPDebugMenu
//
//  Created by Sergio Padrino on 17/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPDebugMenuAction.h"

@class SPExampleSettings;

@interface SPImmediateChangeSettingAction : NSObject <SPDebugMenuAction>

@property (nonatomic, strong) SPExampleSettings *settings;

@end
