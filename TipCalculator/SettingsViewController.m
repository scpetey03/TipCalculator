//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Ryan Pedersen on 2/24/14.
//  Copyright (c) 2014 Bootcamp. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *defaultSwitch;
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Settings";
    }
    return self;
}

- (void)viewDidLoad
{

}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.defaultSwitch.on = [defaults integerForKey:@"setDefault"];

    self.defaultTipControl.selectedSegmentIndex = [defaults integerForKey:@"tipAmount"];
        
}

- (void)viewWillDisappear:(BOOL)animated {
    BOOL defaultOn = self.defaultSwitch.isOn;
    NSArray *defaultIndex = @[@(0), @(1), @(2)];
    float defaultValue = [defaultIndex[self.defaultTipControl.selectedSegmentIndex] floatValue];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:defaultOn forKey:@"setDefault"];
    [defaults setInteger:defaultValue forKey:@"tipAmount"];
    [defaults synchronize];
}

@end
