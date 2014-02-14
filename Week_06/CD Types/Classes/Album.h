//
//  Album.h
//  CD Types
//
//  Created by Peter McIntyre on 2/13/2014.
//  Copyright (c) 2014 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Album : NSManagedObject

@property (nonatomic, retain) id albumImage;
@property (nonatomic, retain) NSString * albumName;
@property (nonatomic, retain) NSString * artistName;
@property (nonatomic, retain) NSNumber * minutes;
@property (nonatomic, retain) NSDate * releaseDate;
@property (nonatomic, retain) NSNumber * sellPrice;

@end
