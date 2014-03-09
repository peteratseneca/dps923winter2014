//
//  Program.h
//  ICT WS v2
//
//  Created by Peter McIntyre on 2014-03-09.
//  Copyright (c) 2014 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Program : NSManagedObject

@property (nonatomic, retain) NSNumber * semesters;
@property (nonatomic, retain) NSString * objectDescription;
@property (nonatomic, retain) NSString * credential;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * code;
@property (nonatomic, retain) NSNumber * objectIdentifier;

@end
