//
//  ProfessorView.h
//  CD 1
//
//  Created by Peter McIntyre on 2/19/2014.
//  Copyright (c) 2014 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfessorView : UIViewController

// Data for the controller
@property (nonatomic, strong) Model *model;
@property (nonatomic, strong) Professor *o;

// User interface
@property (weak, nonatomic) IBOutlet UILabel *fullName;
@property (weak, nonatomic) IBOutlet UILabel *office;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *webSite;

@end
