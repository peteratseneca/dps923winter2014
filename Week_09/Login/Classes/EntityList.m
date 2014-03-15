//
//  EntityList.m
//
//  Data source is a fetched results controller
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

- (void)updateUI:(NSNotification *)notification;

@end

@implementation EntityList {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Increase the table cell height
    //self.tableView.rowHeight = 60.0f;
    
    // Register for a notification
    // Change "ObjectName" to the class name of the object that sent the notification
    // Change "MethodName" to the method name in the object above
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUI:) name:@"ObjectName_MethodName_fetch_completed" object:nil];


    
    
    
    
    
    
    
    // Remove the following "return" statement in your own app!
    // It's here to allow this app template to load without errors
    return;
    
    
    
    
    
    
    
    
    
    // Configure and load the fetched results controller (frc)
    
    // Edit the following statement to set/configure the frc you want to use
    _frc = self.model.frc_entity;
    
    // This controller with be the frc delegate
    _frc.delegate = self;
    // No predicate (which means the results will NOT be filtered)
    _frc.fetchRequest.predicate = nil;
    
    // Create an error object
    NSError *error = nil;
    // Perform fetch, and if there's an error, log it
    if (![_frc performFetch:&error]) { NSLog(@"%@", [error description]); }
}

#pragma mark - Notification handlers

- (void)updateUI:(NSNotification *)notification
{
    // This method is called when there's new/updated data from the network
    [self.tableView reloadData];
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
        EntityName *o = [_frc objectAtIndexPath:[self.tableView indexPathForSelectedRow]];

        // Configure the next view + controller
        EntityView *nextVC = (EntityView *)segue.destinationViewController;
        
        nextVC.title = o.attributeName;
        nextVC.model = self.model;
        nextVC.o = o;
    }
    */
}

#pragma mark - Table view update methods

// Handle row deletion
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Two ways to think about this...
        // 1. Do the 'delete' task here, or
        // 2. Add a method to the model object to delete the object
        // Either way is fine
        
        // Get a reference to the context
        NSManagedObjectContext *context = [_frc managedObjectContext];
        // Delete the object from the collection
        [context deleteObject:[_frc objectAtIndexPath:indexPath]];
        
        // Attempt to save changes
        NSError *error = nil;
        if (![context save:&error])
        {
            // Many different ways of handling the error
            // Here, we just send a message to the debug console log
            NSLog(@"Error when deleting: %@, %@", error, [error userInfo]);
        }
    }
}

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
    
    switch(type)
    {
        // Insert
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        // Delete
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

@end
