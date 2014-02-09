//
//  SelectColour.m
//  TVS Single
//
//  Created by Peter McIntyre on 2/2/2014.
//  Copyright (c) 2014 School of ICT, Seneca College. All rights reserved.
//

#import "SelectColour.h"

@interface SelectColour ()

@end

@implementation SelectColour

#pragma mark - Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.model.colours count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    // Fetch the object from the backing store
    //NSMutableDictionary *selectedObject = [self.model.colours objectAtIndex:indexPath.row];
    ColourThing *selectedObject = [self.model.colours objectAtIndex:indexPath.row];
    
    cell.textLabel.text = selectedObject.colourName;
    
    if ([selectedObject.selectedState isEqualToString:@"yes"]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Fetch the object from the backing store
    //NSMutableDictionary *selectedObject = (NSMutableDictionary *)[self.model.colours objectAtIndex:indexPath.row];
    ColourThing *selectedObject = [self.model.colours objectAtIndex:indexPath.row];
    
    // Toggle the check mark state
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        // Remove the check mark
        cell.accessoryType = UITableViewCellAccessoryNone;
        // Save the selected state to "no"
        selectedObject.selectedState = @"no";
    }
    else {
        // Add the check mark
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        // Save the selected state to "yes"
        selectedObject.selectedState = @"yes";
    }
    
    // Deselect the row
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)doneSelecting:(UIBarButtonItem *)sender
{
    // Gather all of the objects with check marks
    
    // First, create a displayable string to hold the values
    NSMutableString *selectedColours = [[NSMutableString alloc] init];
    
    // Go through the array data source, and check for the items with the selected state
    for (int i = 0; i < [self.model.colours count]; i++) {

        // Get the object in the array
        ColourThing *colour = [self.model.colours objectAtIndex:i];
        
        // If it's selected, then append to the displayable string
        if ([colour.selectedState isEqualToString:@"yes"]) {
            [selectedColours appendFormat:([selectedColours length] == 0) ? @"%@" : @"\n%@", colour.colourName];
        }
    }

    // Package the data
    
    // Call the delegate method
    [self.delegate itemSelectorController:self didSelectItem:selectedColours];
    
}

@end
