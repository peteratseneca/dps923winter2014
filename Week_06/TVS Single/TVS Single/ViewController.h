//
//  ViewController.h
//  TVS Single
//
//  Created by Peter McIntyre on 2/2/2014.
//  Copyright (c) 2014 School of ICT, Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectColour.h"

// Conform to the ItemSelector protocol
@interface ViewController : UIViewController <ItemSelector>

@property (nonatomic, strong) Model *model;

@property (weak, nonatomic) IBOutlet UILabel *results;

@end
