//
//  SPChangeSettingViewController.m
//  SPDebugMenu
//
//  Created by Sergio Padrino on 17/11/13.
//  Copyright (c) 2013 Sergio Padrino. All rights reserved.
//

#import "SPChangeSettingViewController.h"

#import "SPExampleSettings.h"

@interface SPChangeSettingViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *settingSwitch;

@end

@implementation SPChangeSettingViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.settingSwitch.on = self.settings.someSetting;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.delegate changeSettingViewControllerDidFinish:self];
}

- (IBAction)settingSwitchChanged:(id)sender
{
    self.settings.someSetting = self.settingSwitch.on;
}

@end
