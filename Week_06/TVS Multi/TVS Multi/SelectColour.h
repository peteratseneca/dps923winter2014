//
//  SelectColour.h
//  TVS Single
//
//  Created by Peter McIntyre on 2/2/2014.
//  Copyright (c) 2014 School of ICT, Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

// Forward declaration
@protocol ItemSelector;

@interface SelectColour : UITableViewController

// Must configure a "delegate" property
@property (nonatomic, weak) id <ItemSelector> delegate;

@property (nonatomic, strong) Model *model;

- (IBAction)doneSelecting:(UIBarButtonItem *)sender;

@end

// Protocol declaration
@protocol ItemSelector <NSObject>

- (void)itemSelectorController:(id)controller didSelectItem:(id)item;

@end