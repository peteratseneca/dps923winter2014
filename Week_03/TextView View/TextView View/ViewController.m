//
//  ViewController.m
//  TextView View
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

    // How many characters in the text view?
    int textViewLength = [self.courseDescription.text length];
    // Update the label
    self.results.text = [NSString stringWithFormat:@"Text view, view (%d characters)", textViewLength];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
