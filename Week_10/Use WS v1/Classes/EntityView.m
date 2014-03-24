//
//  EntityView.m
//
//  Data source is a custom NSManagedObject subclass
//
//  Created by Peter McIntyre on 2012/10/05.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "EntityView.h"

@interface EntityView ()

@end

@implementation EntityView {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Load the user interface
    self.attributeName.text = self.o[@"Description"];
}

@end
