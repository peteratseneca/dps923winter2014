//
//  Model.h
//  Air Seneca
//
//  Created by Peter McIntyre on 1/27/2014.
//  Copyright (c) 2014 School of ICT, Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

// Logically associated with the segmented control
@property (nonatomic, strong) NSArray *ticketCost;
@property (nonatomic, strong) NSMutableArray *seatsAvailable;

// Picker view data source
@property (nonatomic, strong) NSMutableArray *pickerRows;

- (void)buyTickets:(int)numberOfTickets onFlight:(int)flightNumber;

- (void)generatePickerRowsForFlight:(int)flightNumber;

@end
