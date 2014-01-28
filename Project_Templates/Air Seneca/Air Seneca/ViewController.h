//
//  ViewController.h
//  Air Seneca
//
//  Created by Peter McIntyre on 1/27/2014.
//  Copyright (c) 2014 School of ICT, Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

// Model object reference
@property (nonatomic, strong) Model *model;

// User interface
@property (weak, nonatomic) IBOutlet UISegmentedControl *flightSelector;
@property (weak, nonatomic) IBOutlet UIPickerView *ticketSelector;
@property (weak, nonatomic) IBOutlet UILabel *highlightedTicket;
@property (weak, nonatomic) IBOutlet UILabel *buyResultMessage;

// Actions and user operations
- (IBAction)flightNumberChanged:(UISegmentedControl *)sender;
- (IBAction)buyTickets:(UIButton *)sender;

@end
