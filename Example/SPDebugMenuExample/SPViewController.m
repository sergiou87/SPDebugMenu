// SPViewController.m
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


#import "SPViewController.h"

#import "SPExampleSettings.h"

@interface SPViewController ()

@property (nonatomic, strong) SPExampleSettings *settings;

@property (nonatomic, weak) IBOutlet UILabel *tapMeLabel;

@end

@implementation SPViewController

- (instancetype)initWithSettings:(SPExampleSettings *)settings
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _settings = settings;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tapMeLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMeLabelWasTapped:)];
    [self.tapMeLabel addGestureRecognizer:tapGestureRecognizer];
}

- (void)tapMeLabelWasTapped:(UITapGestureRecognizer *)gestureRecognizer
{
    NSString *message = [NSString stringWithFormat:@"Taps work even with tap triggers in your window. BTW right now the magic is %@",
                         self.settings.magicEnabled ? @"enabled :D Are you a wizard?" : @"NOT enabled :("];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hello!"
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertView show];
}

- (void)didReceiveMemoryWarning
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@":O"
                                                        message:@"What's this? It's a memory warning notification!"
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
    [alertView show];
}

@end
