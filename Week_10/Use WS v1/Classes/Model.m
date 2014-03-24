//
//  Model.m
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

// Template for a 'get all' request
- (NSArray *)gwGetAll
{
    if (_gwGetAll) { return _gwGetAll; }
    
    _gwGetAll = [[NSArray alloc] init];
    
    WebServiceRequest *gwGetAll = [[WebServiceRequest alloc] init];
    [gwGetAll sendRequestToUrlPath:@"/api/gradedworks" forDataKeyName:@"Collection" from:self propertyNamed:NSStringFromSelector(_cmd)];
    
    return  _gwGetAll;
}

// Refresh
- (void)gwGetAllRefresh
{
    WebServiceRequest *gwGetAll = [[WebServiceRequest alloc] init];
    [gwGetAll sendRequestToUrlPath:@"/api/gradedworks" forDataKeyName:@"Collection" from:self propertyNamed:@"getAll"];
}

// Template for a 'get one' request
- (NSDictionary *)gwGetOne
{
    if (_gwGetOne) { return _gwGetOne; }
    
    _gwGetOne = [[NSDictionary alloc] init];
    
    WebServiceRequest *gwGetOne = [[WebServiceRequest alloc] init];
    [gwGetOne sendRequestToUrlPath:@"/api/gradedworks/1004" forDataKeyName:@"Item" from:self propertyNamed:NSStringFromSelector(_cmd)];
    
    return _gwGetOne;
}

// Template for a 'get some filtered' request
- (NSArray *)gwGetSome
{
    if (_gwGetSome) { return _gwGetSome; }
    
    _gwGetSome = [[NSArray alloc] init];
    
    WebServiceRequest *gwGetSome = [[WebServiceRequest alloc] init];
    [gwGetSome sendRequestToUrlPath:@"/api/gradedworks?courseid=2" forDataKeyName:@"Collection" from:self propertyNamed:NSStringFromSelector(_cmd)];
    
    return _gwGetSome;
}

// Typical 'add new' request template
- (void)addNewGwItem:(NSDictionary *)newItem
{
    WebServiceRequest *gwAddNewItem = [[WebServiceRequest alloc] init];

    gwAddNewItem.httpMethod = @"POST";
    gwAddNewItem.messageBody = newItem;
    
    NSLog(@"\naddNewItem dictionary being sent...\n%@", [newItem description]);
    
    [gwAddNewItem sendRequestToUrlPath:@"/api/gradedworks" forDataKeyName:@"Item" from:self propertyNamed:@"editedItem"];
}




#pragma mark - Data from the network

// This is a custom getter for an array of results from the network
// Use this as a template... copy it, paste it, and then edit it
- (NSArray *)dataFromNetwork
{
    // If the data exists, return it
    if (_dataFromNetwork) { return _dataFromNetwork; }

    // Otherwise, must fetch the data...
    
    // Initialize an empty array
    _dataFromNetwork = [[NSArray alloc] init];

    // Initialize a web service requestor
    WebServiceRequest *getNamedCollection = [[WebServiceRequest alloc] init];

    
    // Execute the web service requestor
    [getNamedCollection sendRequestToUrlPath:@"/programs" forDataKeyName:@"Collection" from:self propertyNamed:NSStringFromSelector(_cmd)];
    
    return _dataFromNetwork;
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

// This is a custom getter for the fetched results controller property
// Use this as a template... copy it, paste it, and then edit it
- (NSFetchedResultsController *)frc_entity
{
    // Inside a custom getter, you must use the underscore-prefixed name (of the instance variable that backs the property)
    
    // If the frc is already configured, simply return it
    if (_frc_entity) { return _frc_entity; }
    
    // Otherwise, create a new frc, and set it as the property (and return it below)
    _frc_entity = [_cdStack frcWithEntityNamed:@"EntityName" withPredicateFormat:nil predicateObject:nil sortDescriptors:@"attributeName,YES" andSectionNameKeyPath:nil];
    
    return _frc_entity;
}    

- (NSURL *)applicationDocumentsDirectory
{
    // Get a reference to the file system
    NSFileManager *fs = [[NSFileManager alloc] init];
    
    // URL to documents directory
    return [[fs URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] firstObject];
}

@end
