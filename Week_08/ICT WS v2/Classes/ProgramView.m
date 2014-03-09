//
//  AlbumView.m
//  CD Types
//
//  Created by Peter McIntyre on 2012/10/05.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import "ProgramView.h"

@interface ProgramView ()

@end

@implementation ProgramView {}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Load the user interface
    self.programName.text = self.o[@"Name"];
    self.programCredential.text = self.o[@"Credential"];
    self.programDescription.text = self.o[@"Description"];
}

@end
