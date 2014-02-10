//
//  MasterViewController.m
//  NavTemplate
//
//  Created by Peter McIntyre on 2014-02-10.
//  Copyright (c) 2014 School of ICT. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

@interface MasterViewController ()
{
    // Private data store
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

// We do not need this method
- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // This code adds an "Edit" button to the left side of the nav bar
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    // This code adds a "+" (add) button to the right side of the nav bar
    // Its action will be the "insertNewObject:" method in this class
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Called by the runtime when the user taps the + button
- (void)insertNewObject:(id)sender
{
    // First, if the data store doesn't exist, create it
    // This could also be done in the viewDidLoad method
    if (!_objects)
    {
        _objects = [[NSMutableArray alloc] init];
    }
    
    // Add a new object to the data store
    [_objects insertObject:[NSDate date] atIndex:0];
    
    // Manually update the table view
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // How many sections?
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // How many rows in the section?
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // This code is provided with the controller template
    // It gets a reference to a cell object, so it can be configured
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    // Get the data from the data store for the selected/tapped row
    NSDate *object = _objects[indexPath.row];
    
    // Set the cell's text label
    cell.textLabel.text = [object description];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // This code enables smoothly-animated edit actions
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Always check the transition that you're interested in
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        // Which cell was tapped by the user?
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];

        // Get the object from the data source
        NSDate *object = _objects[indexPath.row];

        // Pass the object to the destination controller
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
