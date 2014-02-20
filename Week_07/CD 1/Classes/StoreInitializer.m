//
//  DataCreator.m
//  Classes
//
//  Created by Peter McIntyre on 2012/06/26.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "StoreInitializer.h"

@implementation StoreInitializer {}

+ (void)create:(Model *)model
{
    // Create objects
    // They get created in the managed object context object
    // Later, when the saveChanges message is sent, the Core Data infrastructure saves them to the store
    
    Professor *peter = [model addNew:@"Professor"];
    peter.fullName = @"Peter McIntyre";
    peter.office = @"T2080";
    peter.email = @"peter.mcintyre@senecacollege.ca";
    peter.webSite = @"http://petermcintyre.com";

    Professor *ian = [model addNew:@"Professor"];
    ian.fullName = @"Ian Tipson";
    ian.office = @"T2079";
    ian.email = @"ian.tipson@senecacollege.ca";
    ian.webSite = @"http://iantipson.com";
    
    Professor *jordan = [model addNew:@"Professor"];
    jordan.fullName = @"Jordan Anastasiade";
    jordan.office = @"T1034";
    jordan.email = @"jordan.anastasiade@senecacollege.ca";
    jordan.webSite = @"https://scs.senecac.on.ca/~jordan.anastasiade";
    
    Professor *barb = [model addNew:@"Professor"];
    barb.fullName = @"Barb Czegel";
    barb.office = @"T2095";
    barb.email = @"barb.czegel@senecacollege.ca";
    barb.webSite = @"https://scs.senecac.on.ca/~barb.czegel";
    
    // Save
    [model saveChanges];
}

+ (NSDate *) NewDateFromYear:(int)year month:(int)month day:(int)day
{
	NSCalendar *c = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
	NSDateComponents *dc = [[NSDateComponents alloc] init];
	[dc setYear:year];
	[dc setMonth:month];
	[dc setDay:day];
	[dc setHour:0];
	[dc setMinute:0];
	return [c dateFromComponents:dc];
}

@end
