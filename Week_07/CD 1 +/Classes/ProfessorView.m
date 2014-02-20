//
//  ProfessorView.m
//  CD 1
//
//  Created by Peter McIntyre on 2/19/2014.
//  Copyright (c) 2014 Seneca College. All rights reserved.
//

#import "ProfessorView.h"

@interface ProfessorView ()

@end

@implementation ProfessorView

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.fullName.text = self.o.fullName;
    self.office.text = self.o.office;
    self.email.text = self.o.email;
    self.webSite.text = self.o.webSite;
}

@end
