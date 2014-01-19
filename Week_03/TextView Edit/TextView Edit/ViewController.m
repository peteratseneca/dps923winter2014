//
//  ViewController.m
//  TextView Edit
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

- (IBAction)doneEditing:(UIButton *)sender {
    
    // Count the characters, NSLog this info
    int textViewLength = [self.courseDescription.text length];
    NSLog(@"\nText view has %d characters", textViewLength);
    
    // Dismiss the keyboard
    [self.courseDescription resignFirstResponder];
    
    // Could also do other tasks
}

#pragma mark - Text view delegate methods

- (void)textViewDidBeginEditing:(UITextView *)textView {
    
    NSLog(@"\n%s", __FUNCTION__);
    // Could also do other tasks
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    
    NSLog(@"\n%s", __FUNCTION__);
    // Could also do other tasks
}

- (void)textViewDidChange:(UITextView *)textView {
    
    NSLog(@"\n%s", __FUNCTION__);
    // Could also do other tasks
}

@end
