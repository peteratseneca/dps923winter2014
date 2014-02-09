//
//  Model.m
//  TVS Single
//
//  Created by Peter McIntyre on 2/2/2014.
//  Copyright (c) 2014 School of ICT, Seneca College. All rights reserved.
//

#import "Model.h"

@implementation Model

- (id)init {
    
    if (self = [super init]) {
        
        ColourThing *red = [[ColourThing alloc] initWithColourName:@"Red" andSelectedState:@"no"];
        ColourThing *green = [[ColourThing alloc] initWithColourName:@"Green" andSelectedState:@"no"];
        ColourThing *blue = [[ColourThing alloc] initWithColourName:@"Blue" andSelectedState:@"no"];
        ColourThing *orange = [[ColourThing alloc] initWithColourName:@"Orange" andSelectedState:@"no"];
        ColourThing *brown = [[ColourThing alloc] initWithColourName:@"Brown" andSelectedState:@"no"];
        ColourThing *purple = [[ColourThing alloc] initWithColourName:@"Purple" andSelectedState:@"no"];
        
//        NSMutableDictionary *red = (NSMutableDictionary *)@{@"Selected": @"no", @"Colour": @"Red"};
//        NSMutableDictionary *green = (NSMutableDictionary *)@{@"Selected": @"no", @"Colour": @"Green"};
//        NSMutableDictionary *blue = (NSMutableDictionary *)@{@"Selected": @"no", @"Colour": @"Blue"};
//        NSMutableDictionary *orange = (NSMutableDictionary *)@{@"Selected": @"no", @"Colour": @"Orange"};
//        NSMutableDictionary *brown = (NSMutableDictionary *)@{@"Selected": @"no", @"Colour": @"Brown"};
//        NSMutableDictionary *purple = (NSMutableDictionary *)@{@"Selected": @"no", @"Colour": @"Purple"};
        
        _colours = @[red, green, blue, orange, brown, purple];
    }
    return self;
}

@end
