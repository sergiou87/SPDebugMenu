// SPDebugMenuLongPressTrigger.m
//
// The MIT License (MIT)
//
// Copyright (c) 2014 Sergio Padrino
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


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
