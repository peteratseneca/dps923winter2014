//
//  Model.m
//  CD Simple
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "Model.h"
#import "CDStack.h"
#import "StoreInitializer.h"
#import "ImageToDataTransformer.h"

@interface Model ()
{
    // Core Data stack (private instance variable)
    CDStack *_cdStack;
}

// Private method
- (NSURL *)applicationDocumentsDirectory;

@end

@implementation Model

#pragma mark - Object lifecycle

- (id)init
{
    self = [super init];
    if (self) 
    {
        // Check whether the app is being launched for the first time
        // If yes, check if there's an object store file in the app bundle
        // If yes, copy the object store file to the Documents directory
        // If no, create some new data if you need to
        
        // URL to the object store file in the app bundle
        NSURL *storeFileInBundle = [[NSBundle mainBundle] URLForResource:@"ObjectStore" withExtension:@"sqlite"];
        
        // URL to the object store file in the Documents directory
        NSURL *storeFileInDocumentsDirectory = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"ObjectStore.sqlite"];
        
        // System file manager
        NSFileManager *fs = [[NSFileManager alloc] init];
        
        // Check whether this is the first launch of the app
        BOOL isFirstLaunch = ![fs fileExistsAtPath:[storeFileInDocumentsDirectory path]];
        
        // Check whether the app is supplied with starter data in the app bundle
        BOOL hasStarterData = [fs fileExistsAtPath:[storeFileInBundle path]];
        
        if (isFirstLaunch) 
        {
            if (hasStarterData) 
            {
                // Use the supplied starter data
                [fs copyItemAtURL:storeFileInBundle toURL:storeFileInDocumentsDirectory error:nil];
                // Create a Core Data stack object after copying file
                _cdStack = [[CDStack alloc] init];
            }
            else 
            {
                // Create a Core Data stack object before creating new data
                _cdStack = [[CDStack alloc] init];
                // Create some new data
                [StoreInitializer create:self];
            }
        }
        else 
        {
            _cdStack = [[CDStack alloc] init];
        }
    }
    return self;
}

#pragma mark - Managed object maintenance

// Generic 'add new' method
- (id)addNew:(NSString *)entityName
{
    // Create and return the new managed object
    return [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:_cdStack.managedObjectContext];
}

- (void)saveChanges
{
    [_cdStack saveContext];
}

#pragma mark - Fetched results controllers

- (NSFetchedResultsController *)frc_professor
{
    // Inside a custom getter, you must use the underscore-prefixed name (of the instance variable that backs the property)
    
    // If the frc is already configured, simply return it
    if (_frc_professor) { return _frc_professor; }
    
    // Otherwise, create a new frc, and set it as the property (and return it below)
    _frc_professor = [_cdStack frcWithEntityNamed:@"Professor" withPredicateFormat:nil predicateObject:nil sortDescriptors:@"fullName,YES" andSectionNameKeyPath:nil];
    
    return _frc_professor;
}

- (NSURL *)applicationDocumentsDirectory
{
    // Get a reference to the file system
    NSFileManager *fs = [[NSFileManager alloc] init];
    
    // URL to documents directory
    return [[fs URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
}

@end
