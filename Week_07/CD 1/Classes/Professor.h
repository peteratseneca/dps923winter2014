//
//  Professor.h
//  CD 1
//
//  Created by Peter McIntyre on 2/19/2014.
//  Copyright (c) 2014 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Professor : NSManagedObject

@property (nonatomic, retain) NSString * webSite;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * office;
@property (nonatomic, retain) NSString * fullName;

@end
