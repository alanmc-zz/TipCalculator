//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Alan McConnell on 10/10/14.
//  Copyright (c) 2014 Alan McConnell. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger defaultIndex = [defaults integerForKey:@"default_tip_index"];
    self.defaultTipControl.selectedSegmentIndex = defaultIndex;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveDefaultValue:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultTipControl.selectedSegmentIndex forKey:@"default_tip_index"];
    [defaults synchronize];
}
@end
