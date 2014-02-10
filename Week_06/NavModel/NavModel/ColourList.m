//
//  ColourList.m
//  NavBuild
//
//  Created by Peter McIntyre on 2014-02-10.
//  Copyright (c) 2014 School of ICT. All rights reserved.
//

#import "ColourList.h"
#import "ColourDetail.h"

@implementation ColourList

#pragma mark - View lifecycle

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
    return [self.model.colours count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    // Fetch the data from the data source
    NSString *colourName = [self.model.colours[indexPath.row] description];

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
        NSString *colourName = [self.model.colours[row] description];
        
        // Pass it to the destination controller
        ColourDetail *vc = (ColourDetail *)segue.destinationViewController;
        vc.colourName = colourName;
    }
}


@end
