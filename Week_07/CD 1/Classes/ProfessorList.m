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
}

@end
