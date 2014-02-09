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
    NSString *selectedObject = [[self.model.colours objectAtIndex:indexPath.row] description];
    
    cell.textLabel.text = selectedObject;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Fetch the object from the backing store
    NSString *selectedObject = [[self.model.colours objectAtIndex:indexPath.row] description];
    
    // Package the data (it's already a string, so it's good as-is)
    
    // Call the delegate method
    [self.delegate itemSelectorController:self didSelectItem:selectedObject];
}

@end
