//
//  EventList.m
//  CD Simple
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "EventList.h"
#import "EventDetail.h"

@interface EventList ()
{
    // Not necessary, but it's nice - why?
    // It shortens the reference to the fetched results controller
    // from "self.model.frc_event" to "_frc"
    NSFetchedResultsController *_frc;
}

@end

@implementation EventList

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    _frc = self.model.frc_event;
    
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

    // This code example will use the NSManagedObject type
    // All other code examples will use a custom class for each entity
    
    // Fetch the object from the data store at the tapped row (index path = section plus row info)
    NSManagedObject *o = [_frc objectAtIndexPath:indexPath];
    
    // Extract the displayable data and assign it to the cell's text label
    cell.textLabel.text = [[o valueForKey:@"timeStamp"] description];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toEventDetail"]) 
    {
        // Get a reference to the next-level view controller, and configure it 
        EventDetail *vc = (EventDetail *)segue.destinationViewController;
        
        // Pass on the data for the tapped row
        vc.o = [_frc objectAtIndexPath:[self.tableView indexPathForSelectedRow]];
    }
}

#pragma mark - User operations

- (IBAction)addEvent:(id)sender 
{
    // This code example will use the NSManagedObject type
    // All other code examples will use a custom class for each entity

    NSManagedObject *newObject = [self.model addNew:@"Event"];
    
    [newObject setValue:[NSDate date] forKey:@"timeStamp"];
    
    [self.model saveChanges];
}

#pragma mark - Content change handling methods (for programmatic store changes) 

// Choose either the top single method, or the bottom three methods
// Uncomment each to see the differences

///*

// This single method instantly updates the table, with no animations

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    // In the simplest, most efficient, case, reload the table view.
    [self.tableView reloadData];
}

//*/

/*

// These three methods will add the new row with a smooth animation

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

*/

@end
