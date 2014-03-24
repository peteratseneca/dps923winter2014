//
//  EntityEdit.m
//  Use WS v1
//
//  Created by Peter McIntyre on 2014-03-23.
//  Copyright (c) 2014 Seneca College. All rights reserved.
//

#import "EntityEdit.h"

@interface EntityEdit ()

@end

@implementation EntityEdit

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // If there is a detail item, then we're in "edit" mode, so configure the user interface
    if (self.detailItem)
    {
        // etc.
    }
}

#pragma mark - User operations

- (IBAction)save:(UIBarButtonItem *)sender
{
    // Dismiss the keyboard
    [self.view endEditing:NO];
    
    if (self.itemTitle.text.length == 0)
    {
        self.itemTitle.placeholder = @"REQUIRED - Title";
        return;
    }

    if (self.itemDescription.text.length == 0)
    {
        self.itemDescription.placeholder = @"REQUIRED - Description";
        return;
    }

    // Must hand-convert NSDate into ISO 8601 format
    // Future versions of this app will include a converter that runs automatically
    NSDateFormatter *isoDate = [[NSDateFormatter alloc] init];
    [isoDate setDateFormat:@"yyyy-MM-dd'T'hh:mm'Z'"];
    NSString *dateAssigned = [isoDate stringFromDate:[NSDate date]];
    NSString *dateDue = [isoDate stringFromDate:[self.itemDueDate date]];
    
    NSDictionary *d = @{@"Title":self.itemTitle.text, @"Description":self.itemDescription.text, @"GradedWorkType":[self.itemType titleForSegmentAtIndex:self.itemType.selectedSegmentIndex], @"MoreInfoUrl":@"http://example.com", @"Value":[NSNumber numberWithFloat:self.itemValue.value], @"DateAssigned":dateAssigned, @"DateDue":dateDue, @"Duration":[NSNumber numberWithInt:0], @"CourseId":[NSNumber numberWithInt:2]};

    // Call the delegate, pass in nil
    [self.delegate EditEntityController:self didEditItem:d];
}

- (IBAction)cancel:(UIBarButtonItem *)sender
{
    // Call the delegate, pass in nil
    [self.delegate EditEntityController:self didEditItem:nil];
}

- (IBAction)changedSlider:(UISlider *)sender
{
    [self.view endEditing:NO];
    
    // Rounding, to nearest half-value (i.e. 0.5 increments)
    sender.value = roundf(sender.value * 2) / 2;
    self.valueLabel.text = [NSString stringWithFormat:@"Value - %1.2f", sender.value];
}

- (IBAction)changedSegment:(UISegmentedControl *)sender
{
    [self.view endEditing:NO];
}

- (IBAction)changedDatePicker:(UIDatePicker *)sender
{
    [self.view endEditing:NO];
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
