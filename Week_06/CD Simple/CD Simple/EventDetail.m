//
//  EventDetail.m
//  CD Simple
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "EventDetail.h"

@interface EventDetail ()

@end

@implementation EventDetail {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // This code example will use the NSManagedObject type
    // All other code examples will use a custom class for each entity

    // Display a formatted version of the selected date in the user interface
    self.lblEvent.text = [NSDateFormatter localizedStringFromDate:[self.o valueForKey:@"timeStamp"] dateStyle:NSDateFormatterFullStyle timeStyle:NSDateFormatterShortStyle];
}

@end
