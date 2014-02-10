//
//  ColourDetail.m
//  NavBuild
//
//  Created by Peter McIntyre on 2014-02-10.
//  Copyright (c) 2014 School of ICT. All rights reserved.
//

#import "ColourDetail.h"

@interface ColourDetail ()

@end

@implementation ColourDetail

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Update the user interface
    self.colorDetailLabel.text = self.colourName;
    self.title = self.colourName;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
