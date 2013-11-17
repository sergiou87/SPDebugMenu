//
//  SPDebugMenuLongPressTrigger.h
//  SPDebugMenu
//
//  Created by Sergio Padrino on 16/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPDebugMenuTriggering.h"

/// Long press based trigger for the debug menu. You can configure the number
/// of touches required to trigger.
@interface SPDebugMenuLongPressTrigger : NSObject <SPDebugMenuTriggering>

/// View that has to be long pressed to trigger
@property (nonatomic, strong) UIView *view;

@property (nonatomic) NSUInteger numberOfTouchesRequired;

@end
