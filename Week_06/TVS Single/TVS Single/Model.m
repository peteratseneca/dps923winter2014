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
        
        _colours = @[@"Red", @"Green", @"Blue", @"Orange", @"Brown", @"Purple"];
    }
    return self;
}

@end
