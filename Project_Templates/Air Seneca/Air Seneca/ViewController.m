//
//  ViewController.m
//  Air Seneca
//
//  Created by Peter McIntyre on 1/27/2014.
//  Copyright (c) 2014 School of ICT, Seneca College. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Controller lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Generate picker view data source
}

#pragma mark - User operations

- (IBAction)flightNumberChanged:(UISegmentedControl *)sender {

    // Re-generate the picker view data source
    // Reload and refresh the picker view
}

- (IBAction)buyTickets:(UIButton *)sender {
    
    // Create the 'buy' message
    // Buy the tickets
    // Re-generate the picker view data source
    // Reload and refresh the picker view
}

#pragma mark - Delegate methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    // Return the appropriate value
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    // Return the appropriate value
    return @"";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    // Perform the appropriate task
}

@end
