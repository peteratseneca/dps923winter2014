//
//  ViewController.h
//  First iOS App
//
//  Created by Peter McIntyre on 1/19/2014.
//  Copyright (c) 2014 School of ICT, Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// User interface outlets

@property (weak, nonatomic) IBOutlet UITextField *userInput;

@property (weak, nonatomic) IBOutlet UILabel *results;

// User interface action

- (IBAction)doSomething:(UIButton *)sender;

@end
