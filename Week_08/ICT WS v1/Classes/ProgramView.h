//
//  AlbumView.h
//  CD Types
//
//  Created by Peter McIntyre on 2012/10/05.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgramView : UIViewController

// Data for the controller
@property (nonatomic, strong) Model *model;
@property (nonatomic, strong) NSDictionary *o;

// User interface
@property (weak, nonatomic) IBOutlet UILabel *programName;
@property (weak, nonatomic) IBOutlet UILabel *programCredential;
@property (weak, nonatomic) IBOutlet UITextView *programDescription;

@end
