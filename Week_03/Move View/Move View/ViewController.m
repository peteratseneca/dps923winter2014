//
//  ViewController.m
//  Move View
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
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Delegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    NSLog(@"\n%s", __FUNCTION__);

    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    NSLog(@"\n%s", __FUNCTION__);

    // Move the view up
    
    // Make a CGRect for the view (which should be positioned at 0,0 and be 320px wide and 480px tall)
    CGRect viewFrame = self.view.frame;

    // Adjust the origin for the viewFrame CGRect
    viewFrame.origin.y -= 150.0f;

    // The following animation setup just makes it look nice when shifting
    // We don't really need the animation code, but we'll leave it in here
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0.3];
    
    // Apply the new shifted vewFrame to the view
    [self.view setFrame:viewFrame];
    
    // More animation code
    [UIView commitAnimations];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    NSLog(@"\n%s", __FUNCTION__);

    // Move the view down
    
    CGRect viewFrame = self.view.frame;
    viewFrame.origin.y += 150.0f;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0.3];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
    
    // NSLog the result
    NSLog(@"\nText entered was '%@'", textField.text);
}

@end
