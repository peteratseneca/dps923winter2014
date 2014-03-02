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
    // from "self.model.frc_album" to "_frc"
    NSFetchedResultsController *_frc;
}

// Method that handles a 'local notification'
- (void)updateUI:(NSNotification *)notification;

@end

@implementation ProgramList {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Increase the table cell height
    self.tableView.rowHeight = 55.0f;
    
    // Register for a notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUI:) name:@"ProgramsLoadedSuccessfully" object:nil];

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

#pragma mark - Notification handlers

- (void)updateUI:(NSNotification *)notification
{
    // This method is called when a 'local notification' happens
    [self.tableView reloadData];
}

#pragma mark - Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // How many sections for the table view?
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.model.programs count];
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

@end
