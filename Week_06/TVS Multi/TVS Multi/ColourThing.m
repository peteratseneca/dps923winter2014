//
//  ColourThing.m
//  TVS Multi
//
//  Created by Peter McIntyre on 2/2/2014.
//  Copyright (c) 2014 School of ICT, Seneca College. All rights reserved.
//

#import "ColourThing.h"

@implementation ColourThing

- (id)initWithColourName:(NSString *)colour andSelectedState:(NSString *)selected {

    if (self = [super init]) {
        
        _colourName = colour;
        _selectedState = selected;
    }
    return self;
}

@end
