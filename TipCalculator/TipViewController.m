//
//  TipViewController.m
//  TipCalculator
//
//  Created by Alan McConnell on 10/10/14.
//  Copyright (c) 2014 Alan McConnell. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountInput;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalAmountLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipAmountControl;

@end

@implementation TipViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
}

- (void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger defaultIndex = [defaults integerForKey:@"default_tip_index"];
    self.tipAmountControl.selectedSegmentIndex = defaultIndex;
    [self updateValues];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues {
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    float billAmount = [self.billAmountInput.text floatValue];
    float tipAmount = [tipValues[self.tipAmountControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmount;
    
    self.totalAmountLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
    self.tipAmountLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
}

- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}
@end
