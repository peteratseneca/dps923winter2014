//
//  EntityList.m
//  CD Types
//
//  Created by Peter McIntyre on 2012/10/05.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "EntityList.h"
#import "EntityView.h"

@interface EntityList ()
{
    // Not necessary, but it's nice - why?
    // It shortens the reference to the fetched results controller
    // from "self.model.frc_album" to "_frc"
    NSFetchedResultsController *_frc;
}

@end

@implementation EntityList {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Remove the following "return" statement in your own app!
    // It's here to allow this app template to load without errors
    return;
    
    
    
    
    
    
    
    
    
    
    

    _frc = self.model.frc_entity;
    
    // Configure and load the fetched results controller (frc)

    // This controller with be the frc delegate
    _frc.delegate = self;
    // No predicate (which means the results will NOT be filtered)
    _frc.fetchRequest.predicate = nil;
    
    // Create an error object
    NSError *error = nil;
    // Perform fetch, and if there's an error, log it
    if (![_frc performFetch:&error]) { NSLog(@"%@", [error description]); }
}

#pragma mark - Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // How many sections for the table view?
    return [[_frc sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Get the current section info object from the frc
    id <NSFetchedResultsSectionInfo> sectionInfo = [[_frc sections] objectAtIndex:section];
    // How may objects (rows) are in that section?
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    // Fetch the object that backs the current index path (row)
    //Album *o = [_frc objectAtIndexPath:indexPath];
    
    // Set the cell's text label
    //cell.textLabel.text = o.albumName;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    /*
    if ([segue.identifier isEqualToString:@"toEntityView"])
    {
        // Fetch the selected object
        Album *o = [_frc objectAtIndexPath:[self.tableView indexPathForSelectedRow]];

        // Configure the next view + controller
        EntityView *nextVC = (EntityView *)segue.destinationViewController;
        
        nextVC.title = o.albumName;
        nextVC.model = self.model;
        nextVC.o = o;
    }
    */
}

@end
