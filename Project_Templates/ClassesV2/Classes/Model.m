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

// Entity-specific 'add new' method
// This is a better method than the generic one above
/*
- (Album *)addNewAlbum
{
    // Create a new album; notice the cast
    return (Album *)[self addNew:@"Album"];
}
*/
    
// Convenience method, customized to the entity's design
// This may be the best method to use
/*
- (Album *)addNewAlbum:(NSString *)albumName withCoverArt:(UIImage *)albumImage byArtist:(NSString *)artistName releaseOn:(NSDate *)releaseDate sellingFor:(double)sellPrice lengthInMinutes:(int)minutes
{
    // Create a new album; notice the cast
    Album *a = (Album *)[self addNew:@"Album"];
    
    // Strings
    a.albumName = albumName;
    a.artistName = artistName;
    
    // Date
    a.releaseDate = releaseDate;
    
    // Numbers
    // Notice that we are using the NSNumber literal syntax
    a.minutes = @(minutes);
    a.sellPrice = @(sellPrice);
    
    // Image
    a.albumImage = albumImage;
    
    return a;
}
*/
    
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
