//
//  AlbumView.h
//  CD 2 1-M +
//
//  Created by Peter McIntyre on 2014-03-16.
//  Copyright (c) 2014 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlbumView : UIViewController

@property (nonatomic, strong) Model *model;
@property (nonatomic, strong) NSManagedObject *o;

// User interface
@property (weak, nonatomic) IBOutlet UILabel *albumName;
@property (weak, nonatomic) IBOutlet UILabel *genre;
@property (weak, nonatomic) IBOutlet UILabel *releaseDate;

@end
