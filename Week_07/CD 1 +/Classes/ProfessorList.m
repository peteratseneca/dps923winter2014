//
//  ProfessorList.m
//  CD 1
//
//  Created by Peter McIntyre on 2/19/2014.
//  Copyright (c) 2014 Seneca College. All rights reserved.
//

#import "ProfessorList.h"
#import "ProfessorView.h"

@interface ProfessorList ()
{
    // Not necessary, but it's nice - why?
    // It shortens the reference to the fetched results controller
    // from "self.model.frc_album" to "_frc"
    NSFetchedResultsController *_frc;
}
    
@end

@implementation ProfessorList

- (void)viewDidLoad
{
    [super viewDidLoad];

    _frc = self.model.frc_professor;
    
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    // Fetch the object that backs the current index path (row)
    Professor *o = [_frc objectAtIndexPath:indexPath];
    
    // Set the cell's text label
    cell.textLabel.text = o.fullName;

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toProfessorView"])
    {
        // Fetch the selected object
        Professor *o = [_frc objectAtIndexPath:[self.tableView indexPathForSelectedRow]];
        
        // Configure the next view + controller
        ProfessorView *nextVC = (ProfessorView *)segue.destinationViewController;
        
        nextVC.title = o.fullName;
        nextVC.model = self.model;
        nextVC.o = o;
    }
    
    // Modal add/edit
    if ([segue.identifier isEqualToString:@"toProfessorAddEdit"])
    {
        // Configure the next VC (it's embedded in a nav controller)
        UINavigationController *nav = (UINavigationController *)segue.destinationViewController;
        ProfessorEdit *nextVC = (ProfessorEdit *)nav.topViewController;

        nextVC.model = self.model;
        nextVC.delegate = self;
    }
}

#pragma mark - Delegate methods

- (void)EditProfessorController:(id)controller didEditItem:(id)item
{
    // Add a new object to the store, only if an object was passed in
    // Can perform additional business logic and validation here too
    if (item)
    {
        NSDictionary *d = (NSDictionary *)item;
        
        // Create and configure a new Professor object
        // Notice that we're using the new dictionary index syntax
        Professor *newProf = [self.model addNew:@"Professor"];
        newProf.fullName = d[@"fullName"];
        newProf.office = d[@"office"];
        newProf.email = d[@"email"];
        newProf.webSite = d[@"webSite"];
        
        [self.model saveChanges];
    }
    // Dismiss the modal view controller
    [controller dismissViewControllerAnimated:YES completion:NULL];
}





// The following shows two ways to update the table view
// The first way does an immediate reload, with no row animation
// The second way does it with a smooth animation

/*
// This method does an immediate reload - no row animation
- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView reloadData];
}
*/

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
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}
 
@end
