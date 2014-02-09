//
//  ViewController.m
//  TVS Single
//
//  Created by Peter McIntyre on 2/2/2014.
//  Copyright (c) 2014 School of ICT, Seneca College. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - User operations

// Called by the runtime when the user taps the button
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Always check the segue identifier
    if ([segue.identifier isEqualToString:@"toSelectColour"]) {
        
        // Pass on the reference to the model object...
        
        // First, get a reference to the outer navigation controller
        UINavigationController *nav = (UINavigationController *)segue.destinationViewController;
        
        // Then get a reference to the actual select colour controller
        SelectColour *vc = (SelectColour *)nav.topViewController;
        
        // Configure the controller
        vc.model = self.model;
        vc.delegate = self;
    }
}

#pragma mark - Delegate methods

- (void)itemSelectorController:(id)controller didSelectItem:(id)item {
    
    // Update the user interface
    self.results.text = (NSString *)item;
    
    // Dismiss the modal view
    [controller dismissViewControllerAnimated:YES completion:NULL];
}

@end
