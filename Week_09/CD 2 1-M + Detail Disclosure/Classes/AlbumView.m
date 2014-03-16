//
//  AlbumView.m
//  CD 2 1-M +
//
//  Created by Peter McIntyre on 2014-03-16.
//  Copyright (c) 2014 Seneca College. All rights reserved.
//

#import "AlbumView.h"

@interface AlbumView ()

@end

@implementation AlbumView

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.albumName.text = [self.o valueForKey:@"albumName"];
    self.genre.text = [self.o valueForKey:@"genre"];
    self.releaseDate.text = [NSDateFormatter localizedStringFromDate:[self.o valueForKey:@"releaseDate"]dateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterNoStyle];
}

@end
