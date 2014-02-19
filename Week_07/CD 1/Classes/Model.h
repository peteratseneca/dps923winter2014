//
//  Model.h
//  CD Simple
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Professor.h"

@interface Model : NSObject

// Fetched results controllers

@property (nonatomic, strong) NSFetchedResultsController *frc_professor;

// New object factories

- (id)addNew:(NSString *)entityName;

// Data lifecycle

- (void)saveChanges;

@end
