//
//  ColourList.m
//  NavBuild
//
//  Created by Peter McIntyre on 2014-02-10.
//  Copyright (c) 2014 School of ICT. All rights reserved.
//

#import "ColourList.h"
#import "ColourDetail.h"

// Class extension, used to declare private fields and methods for this class
@interface ColourList ()
{
    // Private fields go here
    NSArray *_colours;
}

// Private methods go here

@end

@implementation ColourList

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Prepare the data
    _colours = @[@"Red", @"Green", @"Blue", @"Orange", @"Brown", @"Purple"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_colours count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    // Fetch the data from the data source
    NSString *colourName = [_colours[indexPath.row] description];

    // Yikes!
    // The compiler now supports "array-style subscripting" to dereference an array element
    // When compiled, the statement above is converted into...
    //NSString *colourName = [[_colours objectAtIndex:indexPath.row] description];
    // http://clang.llvm.org/docs/ObjectiveCLiterals.html#subscripting-methods
    
    cell.textLabel.text = colourName;
    
    return cell;
}

#pragma mark - User operations

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure we test for the desired segue...
    if ([segue.identifier isEqualToString:@"toColourDetail"])
    {
        // Which row was tapped by the user?
        int row = [[self.tableView indexPathForSelectedRow] row];
        
        // Get the data from the data source
        NSString *colourName = [_colours[row] description];
        
        // Pass it to the destination controller
        ColourDetail *vc = (ColourDetail *)segue.destinationViewController;
        vc.colourName = colourName;
    }
}


@end
