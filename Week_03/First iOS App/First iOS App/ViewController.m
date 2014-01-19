//
//  ViewController.m
//  First iOS App
//
//  Created by Peter McIntyre on 1/19/2014.
//  Copyright (c) 2014 School of ICT, Seneca College. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doSomething:(UIButton *)sender {
    
    // Copy the user input to the results label
    self.results.text = self.userInput.text;
    
    // Empty/clear the user input text field
    self.userInput.text = @"";
    
    // Dismiss the keyboard
    // If there is only one user interface control that accepts user input,
    // simply send that control a message
    [self.userInput resignFirstResponder];
}

@end
