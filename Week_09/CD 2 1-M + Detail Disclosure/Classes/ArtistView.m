//
//  ArtistView.m
//  CD 2 1-M +
//
//  Created by Peter McIntyre on 2014-03-16.
//  Copyright (c) 2014 Seneca College. All rights reserved.
//

#import "ArtistView.h"

@interface ArtistView ()

@end

@implementation ArtistView

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.artistName.text = [self.o valueForKey:@"artistName"];
}

@end
