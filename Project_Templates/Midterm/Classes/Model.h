//
//  Model.h
//
//  Created by Peter McIntyre on 2014/03/10.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

// Fetched results controllers

@property (nonatomic, strong) NSFetchedResultsController *frc_entity;

// New object factories

- (id)addNew:(NSString *)entityName;

// Data lifecycle

- (void)saveChanges;

@end
