//
//  SPDebugMenuLongPressTrigger.m
//  SPDebugMenu
//
//  Created by Sergio Padrino on 16/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPDebugMenuLongPressTrigger.h"

@interface SPDebugMenuLongPressTrigger ()

@property (nonatomic, strong) UILongPressGestureRecognizer *gestureRecognizer;

@end

@implementation SPDebugMenuLongPressTrigger

@synthesize delegate = _delegate;

- (id)init
{
    self = [super init];
    if (self)
    {
        _gestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGestureRecognizer:)];
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

- (void)handleLongPressGestureRecognizer:(UILongPressGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan)
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
