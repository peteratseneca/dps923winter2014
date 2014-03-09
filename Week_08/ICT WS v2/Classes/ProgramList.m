//
//  EntityList.m
//  CD Types
//
//  Created by Peter McIntyre on 2012/10/05.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ProgramList.h"
#import "ProgramView.h"

@interface ProgramList ()
{
    // Not necessary, but it's nice - why?
    // It shortens the reference to the fetched results controller
    NSFetchedResultsController *_frc;
}

@end

@implementation ProgramList {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Increase the table cell height
    self.tableView.rowHeight = 55.0f;
    
    // We don't care about a notification
    // Why? The fetched results controller will manage state

    _frc = self.model.frc_program;
    
    // Configure and load the fetched results controller (frc)

    // This controller with be the frc delegate
    _frc.delegate = self;
    // No predicate (which means the results will NOT be filtered)
    _frc.fetchRequest.predicate = nil;
    
    // Create an error object
    NSError *error = nil;
    // Perform fetch, and if there's an error, log it
    if (![_frc performFetch:&error]) { NSLog(@"%@", [error description]); }
    
    // If there are no objects in the frc fetchedObjects collection,
    // do a fetch from the network
    if ([_frc.fetchedObjects count] == 0)
    {
        (void)[self.model programs];
    }
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
    NSDictionary *d = [self.model.programs objectAtIndex:indexPath.row];
    // Configure the cell labels
    cell.textLabel.text = d[@"Code"];
    cell.detailTextLabel.text = d[@"Name"];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toProgramView"])
    {
        // Fetch the selected object
        NSDictionary *o = [self.model.programs objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];

        // Configure the next view + controller
        ProgramView *nextVC = (ProgramView *)segue.destinationViewController;
        
        nextVC.title = o[@"Code"];
        nextVC.model = self.model;
        nextVC.o = o;
    }
}

#pragma mark - Fetched results controller delegate methods

// Must add this method to handle the fact that the incoming network results
// were added to the local device data store
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView reloadData];
}

@end
