//
//  AlbumView.m
//  CD Types
//
//  Created by Peter McIntyre on 2012/10/05.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "AlbumView.h"

@interface AlbumView ()

@end

@implementation AlbumView {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Load the user interface
    // Notice the formatted date strings

    self.albumName.text = [self.o valueForKey:@"albumName"];
    self.artistName.text = [self.o valueForKey:@"artistName"];

    self.releaseDate.text = [NSString stringWithFormat:@"Released: %@", [NSDateFormatter localizedStringFromDate:[self.o valueForKey:@"releaseDate"] dateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterNoStyle]];

    self.lengthInMinutes.text = [NSString stringWithFormat:@"Length: %@ minutes", [[self.o valueForKey:@"minutes"] description]];
    
    self.lengthInMinutes.text = [NSString stringWithFormat:@"Length: %d minutes", [[self.o valueForKey:@"minutes"] intValue]];

    self.sellPrice.text = [NSString stringWithFormat:@"MSRP $ %@", [[self.o valueForKey:@"sellPrice"] description]];

    self.albumImage.image = [self.o valueForKey:@"albumImage"];
}

- (void)viewDidUnload {
    [self setAlbumName:nil];
    [self setArtistName:nil];
    [self setReleaseDate:nil];
    [self setLengthInMinutes:nil];
    [self setSellPrice:nil];
    [self setAlbumImage:nil];
    [super viewDidUnload];
}
@end
