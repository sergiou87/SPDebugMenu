//
//  SPViewController.m
//  SPDebugMenu
//
//  Created by Sergio Padrino on 10/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

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

@end
