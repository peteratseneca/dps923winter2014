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

#import "WebServiceRequest.h"

@interface EntityList ()
{
    // Syntax-shortening private instance variables
    NSFetchedResultsController *_frc;
    NSArray *_arr;
}

@end

@implementation EntityList {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Increase the table cell height
    self.tableView.rowHeight = 55.0f;
    
    // Register for a notification
    // Change "ObjectName" to the class name of the object that sent the notification
    // Change "MethodName" to the method name in the object above

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUI:) name:@"ObjectName_MethodName_fetch_completed" object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gwGetAll:) name:@"Model_gwGetAll_fetch_completed" object:nil];
    _arr = self.model.gwGetAll;

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gwAddNewItem:) name:@"Model_editedGwItem_fetch_completed" object:nil];

    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gwGetSome:) name:@"Model_getSome_fetch_completed" object:nil];
    //_arr = self.model.gwGetSome;
    
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gwGetOne:) name:@"Model_getOne_fetch_completed" object:nil];

    // Early return - this example does not use the fetched results controller
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

- (void)gwGetAll:(NSNotification *)notification
{
    // This method is called when there's new/updated data from the network
    NSLog(@"\nGet all:\n%@", [self.model.gwGetAll description]);
    
    _arr = self.model.gwGetAll;
    [self.tableView reloadData];
}

- (void)gwGetSome:(NSNotification *)notification
{
    // This method is called when there's new/updated data from the network
    NSLog(@"\nGet some:\n%@", [self.model.gwGetSome description]);
}

- (void)gwGetOne:(NSNotification *)notification
{
    // This method is called when there's new/updated data from the network
    NSLog(@"\nGet one:\n%@", [self.model.gwGetOne description]);
}

- (void)gwAddNewItem:(NSNotification *)notification
{
    // This method is called when there's new/updated data from the network
    NSLog(@"\nAddNewItem:\n%@", [self.model.editedGwItem description]);
    
    [self.model gwGetAllRefresh];
    return;
    
    self.model.gwGetAll = nil;
    (void)[self.model gwGetAll];
}

#pragma mark - Edit item delegate method

- (void)EditEntityController:(id)controller didEditItem:(id)item
{
    // Add a new object to the store, only if an object was passed in
    // Can perform additional business logic and validation here too
    if (item)
    {
        [self.model addNewGwItem:(NSDictionary *)item];
    }
    // Dismiss the modal view controller
    [controller dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;

    // How many sections for the table view?
    return [[_frc sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arr.count;
    
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
    NSDictionary *o = _arr[indexPath.row];
    
    // Set the cell's text label
    cell.textLabel.text = o[@"Title"];
    cell.detailTextLabel.text = o[@"Description"];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toEntityView"])
    {
        // Fetch the selected object
        int row = [[self.tableView indexPathForSelectedRow] row];
        NSDictionary *o = _arr[row];

        // Configure the next view + controller
        EntityView *nextVC = (EntityView *)segue.destinationViewController;
        
        nextVC.title = o[@"Title"];
        nextVC.model = self.model;
        nextVC.o = o;
    }

    if ([segue.identifier isEqualToString:@"toEntityAdd"])
    {
        // Configure the next view + controller
        UINavigationController *nav = (UINavigationController *)segue.destinationViewController;
        EntityEdit *nextVC = (EntityEdit *)nav.topViewController;
        
        nextVC.model = self.model;
        nextVC.delegate = self;
    }
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
