//
//  SPDebugMenuLongPressTrigger.h
//  SPDebugMenu
//
//  Created by Sergio Padrino on 16/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPDebugMenuTriggering.h"

@interface SPDebugMenuLongPressTrigger : NSObject <SPDebugMenuTriggering>

@property (nonatomic, strong) UIView *view;

@property (nonatomic) NSUInteger numberOfTouchesRequired;

@end
