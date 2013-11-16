//
//  SPDebugMenuTapTrigger.m
//  SPDebugMenu
//
//  Created by Sergio Padrino on 16/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPDebugMenuTapTrigger.h"

@interface SPDebugMenuTapTrigger ()

@property (nonatomic, strong) UITapGestureRecognizer *gestureRecognizer;

@end

@implementation SPDebugMenuTapTrigger

@synthesize delegate = _delegate;

- (id)init
{
    self = [super init];
    if (self)
    {
        _gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGestureRecognizer:)];
    }
    return self;
}

- (void)setView:(UIView *)view
{
    if (_view != view)
    {
        [_view removeGestureRecognizer:self.gestureRecognizer];
        _view = view;
        [_view addGestureRecognizer:self.gestureRecognizer];
    }
}

- (void)handleTapGestureRecognizer:(UITapGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateRecognized)
    {
        [self.delegate debugMenuWasTriggered:self];
    }
}

- (void)setNumberOfTapsRequired:(NSUInteger)numberOfTapsRequired
{
    self.gestureRecognizer.numberOfTapsRequired = numberOfTapsRequired;
}

- (NSUInteger)numberOfTapsRequired
{
    return self.gestureRecognizer.numberOfTapsRequired;
}

- (void)setNumberOfTouchesRequired:(NSUInteger)numberOfTouchesRequired
{
    self.gestureRecognizer.numberOfTouchesRequired = numberOfTouchesRequired;
}

- (NSUInteger)numberOfTouchesRequired
{
    return self.gestureRecognizer.numberOfTouchesRequired;
}

@end
