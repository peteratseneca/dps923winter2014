//
//  ViewController.h
//  UI Controls
//
//  Created by Peter McIntyre on 1/19/2014.
//  Copyright (c) 2014 School of ICT, Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// User interface outlets

@property (weak, nonatomic) IBOutlet UISegmentedControl *itemSelector;
@property (weak, nonatomic) IBOutlet UILabel *segmentResults;

@property (weak, nonatomic) IBOutlet UISlider *temperature;
@property (weak, nonatomic) IBOutlet UILabel *sliderResults;

@property (weak, nonatomic) IBOutlet UISwitch *activateAudio;
@property (weak, nonatomic) IBOutlet UILabel *switchResults;

@property (weak, nonatomic) IBOutlet UIStepper *ageSelector;
@property (weak, nonatomic) IBOutlet UILabel *stepperResults;

@property (weak, nonatomic) IBOutlet UIImageView *myPhoto;

// User interface actions

- (IBAction)itemSelectionChanged:(UISegmentedControl *)sender;

- (IBAction)temperatureChanged:(UISlider *)sender;

- (IBAction)switchTapped:(UISwitch *)sender;

- (IBAction)adjustAge:(UIStepper *)sender;

@end
