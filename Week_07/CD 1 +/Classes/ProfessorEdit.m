//
//  ProfessorEdit.m
//  CD One +
//
//  Created by Peter McIntyre on 2012/07/09.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ProfessorEdit.h"

@interface ProfessorEdit ()

@end

@implementation ProfessorEdit

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // If there is a detail item, then we're in "edit" mode, so configure the user interface
    if (self.detailItem)
    {
        self.fullName.text = self.detailItem.fullName;
        self.office.text = self.detailItem.office;
        self.email.text = self.detailItem.email;
        self.webSite.text = self.detailItem.webSite;
    }
}

#pragma mark - User operations

- (IBAction)cancel:(id)sender 
{
    // Call the delegate, pass in nil
    [self.delegate EditProfessorController:self didEditItem:nil];
}

- (IBAction)save:(id)sender 
{
    // Dismiss the keyboard
    [[self view] endEditing:NO];

    // Do some data validation; all fields need values
    self.errors.text = @"";

    if ([self.fullName.text length] == 0) 
    {
        self.errors.text = @"Professor's full name is required\n";
        [self.fullName resignFirstResponder];
    }

    if ([self.office.text length] == 0) 
    {
        self.errors.text = [NSString stringWithFormat:@"%@Office location is required\n", self.errors.text];
        [self.office resignFirstResponder];
    }

    if ([self.email.text length] == 0) 
    {
        self.errors.text = [NSString stringWithFormat:@"%@Email address is required\n", self.errors.text];
        [self.email resignFirstResponder];
    }

    if ([self.webSite.text length] == 0) 
    {
        self.errors.text = [NSString stringWithFormat:@"%@Web site address is required", self.errors.text];
        [self.webSite resignFirstResponder];
    }

    // Call back to the delegate, only if there are no errors; pass the values from the user interface
    if ([self.errors.text length] == 0) 
    {
        // Make a dictionary, and pass it back to the delegate
        NSDictionary *d = @{ @"fullName" : self.fullName.text,
                             @"office" : self.office.text,
                             @"email" : self.email.text,
                             @"webSite" : self.webSite.text };
        
        [self.delegate EditProfessorController:self didEditItem:d];
    }
}

#pragma mark - Text field delegate methods

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

@end
