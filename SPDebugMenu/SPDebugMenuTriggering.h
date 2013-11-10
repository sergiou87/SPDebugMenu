//
//  SPDebugMenuTriggering.h
//  SPDebugMenu
//
//  Created by Sergio Padrino on 10/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SPDebugMenuTriggeringDelegate;

@protocol SPDebugMenuTriggering <NSObject>

@property (nonatomic, weak) id<SPDebugMenuTriggeringDelegate> delegate;

@end

@protocol SPDebugMenuTriggeringDelegate <NSObject>

- (void)debugMenuWasTriggered:(id<SPDebugMenuTriggering>)sender;

@end
