//
//  Model.h
//  CD Simple
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Program.h"

@interface Model : NSObject

// Data from the network

@property (nonatomic, strong) NSArray *programs;
@property (nonatomic, strong) NSArray *subjects;

@property (nonatomic, strong) NSArray *fetchedCollection;

// Fetched results controllers

@property (nonatomic, strong) NSFetchedResultsController *frc_program;
@property (nonatomic, strong) NSFetchedResultsController *frc_entity;

// New object factories

- (id)addNew:(NSString *)entityName;

// Data lifecycle

- (void)saveChanges;

@end
