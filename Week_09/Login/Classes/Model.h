//
//  Model.h
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "CustomEntityClass.h"

@interface Model : NSObject

// Data from the network

@property (nonatomic, strong) NSArray *dataFromNetwork;

// Fetched results controllers

@property (nonatomic, strong) NSFetchedResultsController *frc_entity;

// New object factories

- (id)addNew:(NSString *)entityName;

/*
- (Album *)addNewAlbum;

- (Album *)addNewAlbum:(NSString *)albumName
          withCoverArt:(UIImage *)albumImage
              byArtist:(NSString *)artistName
             releaseOn:(NSDate *)releaseDate
            sellingFor:(double)sellPrice
       lengthInMinutes:(int)minutes;
*/

// Data lifecycle

- (void)saveChanges;

@end
