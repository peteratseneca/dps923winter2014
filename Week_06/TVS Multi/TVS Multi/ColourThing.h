//
//  ColourThing.h
//  TVS Multi
//
//  Created by Peter McIntyre on 2/2/2014.
//  Copyright (c) 2014 School of ICT, Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColourThing : NSObject

@property (nonatomic, copy) NSString *colourName;
@property (nonatomic, copy) NSString *selectedState;

- (id)initWithColourName:(NSString *)colour andSelectedState:(NSString *)selected;

@end
