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

#pragma mark - Work with the network

// Custom getter
- (NSArray *)programs
{
    // If the data exists, return it
    if (_programs) { return _programs; }
    
    // Otherwise, must fetch the data...

    // Initialize an empty array
    _programs = [[NSArray alloc] init];

    // Configure the URL string
    NSString *urlString = @"http://dps907fall2013.azurewebsites.net/api/programs";
    
    // Create a session configuration object
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    // Create a session object
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    
    // Create a request object
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    // Set its important properties
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    // Reference the app's network activity indicator in the status bar
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    // Define a network task; after it's created, it's in a "suspended" state
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        // If there's a request error, display it
        if (error)
        {
            NSLog(@"\nTask request error: %@", [error description]);
        }
        else
        {
            // FYI, show some details about the response
            // This code is interesting during development, but you would not leave it in production/deployed code
            NSHTTPURLResponse *r = (NSHTTPURLResponse *)response;
            NSLog(@"\nResponse data:\nStatus code: %d\nHeaders:\n%@", r.statusCode, [r.allHeaderFields description]);
            
            // Attempt to deserialize the data from the response
            // If you look at the raw response, you will see that it is delivered as a dictionary
            // The array of results is in the "Collection" key
            NSError *jsonError = nil;
            NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            
            if (jsonError)
            {
                NSLog(@"\nJSON deserialization error: %@", [jsonError description]);
            }
            else
            {
                _programs = results[@"Collection"];
            }
            
            // Next, post a notification for interested listeners
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ProgramsLoadedSuccessfully" object:nil];
        }
        
        // Finally, reference the app's network activity indicator in the status bar
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
    }];
    
    // Resume (which effectively starts) the network task
    [task resume];
    
    return _programs;
}

// Custom getter for a collection that's fetched from the network
- (NSArray *)fetchedCollection
{
    // If the data exists, return it
    if (_fetchedCollection) { return _fetchedCollection; }
    
    // Otherwise, must fetch the data...
    
    // Initialize an empty array
    _fetchedCollection = [[NSArray alloc] init];
    
    // Configure the URL string
    
    // Create a session configuration object
    
    // Create a session object
    
    // Create a request object
    // Set its important properties
    
    // Define a network task; after it's created, it's in a "suspended" state
    
        // Attempt to deserialize the data from the response
        // You must look at the raw response to learn how to extract your data

        // Extract your data

    // Resume (which effectively starts) the network task
    
    return _fetchedCollection;
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
