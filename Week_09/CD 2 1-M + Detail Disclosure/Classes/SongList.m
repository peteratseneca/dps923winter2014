//
//  SongList.m
//  CD Two 1-M
//
//  Created by Peter McIntyre on 2012/07/17.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "SongList.h"
#import "SongView.h"

@interface SongList ()

@end

@implementation SongList {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure and load the fetched results controller
    self.model.frc_song.delegate = self;
    [self.model.frc_song.fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"album == %@", self.ro]];
    [NSFetchedResultsController deleteCacheWithName:@"Song"];
    
    NSError *error = nil;
    [self.model.frc_song performFetch:&error];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark - Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[self.model.frc_song sections] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Songs on this album";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.model.frc_song sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    
    // Fetch the object that backs the current index path (row)
    NSManagedObject *so = [self.model.frc_song objectAtIndexPath:indexPath];
    cell.textLabel.text = [so valueForKey:@"songName"];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toSongView"]) {
        
        // Fetch the selected object
        NSManagedObject *so = [self.model.frc_song objectAtIndexPath:[self.tableView indexPathForSelectedRow]];
        //Configure the next VC
        SongView *nextVC = (SongView *)segue.destinationViewController;
        nextVC.title = [so valueForKey:@"songName"];
        nextVC.model = self.model;
        nextVC.ro = so;
    }

    if ([segue.identifier isEqualToString:@"toSongEdit"]) 
    {
        // Configure the next VC (it's embedded in a nav controller)
        UINavigationController *nav = (UINavigationController *)segue.destinationViewController;
        SongEdit *nextVC = (SongEdit *)nav.topViewController;
        nextVC.model = self.model;
        nextVC.delegate = self;
    }
}

#pragma mark - Delegate methods

- (void)EditSongController:(id)controller didEditItem:(id)item
{
    // Add a new object to the store, only if an object was passed in
    if (item) {
        NSDictionary *d = (NSDictionary *)item;
        [self.model addNewSong:[d valueForKey:@"songName"] forAlbum:self.ro composedBy:[d valueForKey:@"composer"] inYear:[[d valueForKey:@"year"] intValue]];
        [self.model saveChanges];
    }
    // Dismiss the modal view controller
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView reloadData];
}

@end
