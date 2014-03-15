//
//  AlbumList.m
//  CD Types
//
//  Created by Peter McIntyre on 2012/10/05.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "AlbumList.h"
#import "AlbumView.h"

@interface AlbumList ()
{
    // Not necessary, but it's nice - why?
    // It shortens the reference to the fetched results controller
    // from "self.model.frc_album" to "_frc"
    NSFetchedResultsController *_frc;
}

@end

@implementation AlbumList {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Increase the table cell height
    self.tableView.rowHeight = 64.0f;
    
    _frc = self.model.frc_album;
    
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
    Album *o = [_frc objectAtIndexPath:indexPath];
    
    // Set the cell's text labels
    cell.textLabel.text = o.albumName;
    cell.detailTextLabel.text = o.artistName;
    
    // Set the cell's image
    cell.imageView.image = [o.albumImage scaleToSize:CGSizeMake(40.0f, 40.0f)];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toAlbumView"])
    {
        // Fetch the selected object
        Album *o = [_frc objectAtIndexPath:[self.tableView indexPathForSelectedRow]];

        // Configure the next view + controller
        AlbumView *nextVC = (AlbumView *)segue.destinationViewController;
        
        nextVC.title = o.albumName;
        nextVC.model = self.model;
        nextVC.o = o;
    }
}

@end
