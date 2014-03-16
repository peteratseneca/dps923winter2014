//
//  ArtistView.h
//  CD 2 1-M +
//
//  Created by Peter McIntyre on 2014-03-16.
//  Copyright (c) 2014 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArtistView : UIViewController

@property (nonatomic, strong) Model *model;
@property (nonatomic, strong) NSManagedObject *o;

// User interface
@property (weak, nonatomic) IBOutlet UILabel *artistName;

@end
