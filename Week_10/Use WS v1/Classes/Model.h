//
//  Model.h
//
//  Created by Peter McIntyre on 2012/06/22.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "CustomEntityClass.h"
#import "WebServiceRequest.h"

@interface Model : NSObject

// ########## NEW ##########
@property (nonatomic, copy) NSString *authToken;
// ########## NEW ##########

// For a 'get all' request
@property (nonatomic, strong) NSArray *gwGetAll;
- (void)gwGetAllRefresh;

// For a 'get one' request
@property (nonatomic, strong) NSDictionary *gwGetOne;

// For a 'get some filtered' request
@property (nonatomic, strong) NSArray *gwGetSome;

// For an 'add new' request
- (void)addNewGwItem:(NSDictionary *)newItem;
@property (nonatomic, strong) NSDictionary *editedGwItem;





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
