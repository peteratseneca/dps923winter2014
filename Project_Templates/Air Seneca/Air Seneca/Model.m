//
//  Model.m
//  Air Seneca
//
//  Created by Peter McIntyre on 1/27/2014.
//  Copyright (c) 2014 School of ICT, Seneca College. All rights reserved.
//

#import "Model.h"

@implementation Model

#pragma mark - Object lifecycle

- (id)init {
    
    if (self = [super init]) {

        // Initialize the arrays...
        // The ticket cost array is initialized with real data
        // The seats available array is also initialized with real data
        // The picker rows array is initialized empty, with alloc-init
        
    }
    return self;
}

#pragma mark - User operations 

- (void)buyTickets:(int)numberOfTickets onFlight:(int)flightNumber {

    // Add your own code here
}

- (void)generatePickerRowsForFlight:(int)flightNumber {

    // Add your own code here
}

@end
