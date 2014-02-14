//
//  AlbumView.m
//  CD Types
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
    // Notice the formatted date strings

    /*
    self.albumName.text = self.o.albumName;
    
    self.artistName.text = self.o.artistName;

    // Notice the date formatter
    self.releaseDate.text = [NSString stringWithFormat:@"Released: %@", [NSDateFormatter localizedStringFromDate:self.o.releaseDate dateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterNoStyle]];

    self.lengthInMinutes.text = [NSString stringWithFormat:@"Length: %@ minutes", [self.o.minutes description]];
    
    self.lengthInMinutes.text = [NSString stringWithFormat:@"Length: %d minutes", [self.o.minutes intValue]];

    self.sellPrice.text = [NSString stringWithFormat:@"MSRP $ %@", [self.o.sellPrice description]];

    self.albumImage.image = self.o.albumImage;
    */
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
