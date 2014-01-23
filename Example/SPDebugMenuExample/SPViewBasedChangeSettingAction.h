//
//  SPViewBasedChangeSettingAction.h
//  SPDebugMenu
//
//  Created by Sergio Padrino on 17/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPDebugMenuAction.h"

@class SPExampleSettings;

@interface SPViewBasedChangeSettingAction : NSObject <SPDebugMenuAction>

@property (nonatomic, strong) SPExampleSettings *settings;

@end
