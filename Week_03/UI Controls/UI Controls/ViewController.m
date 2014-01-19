//
//  ViewController.m
//  UI Controls
//
//  Created by Peter McIntyre on 1/19/2014.
//  Copyright (c) 2014 School of ICT, Seneca College. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Initial state of the label
    self.segmentResults.text = [NSString stringWithFormat:@"On startup, '%@' is selected", [self.itemSelector titleForSegmentAtIndex:self.itemSelector.selectedSegmentIndex]];
    
    // Initial state of the slider
    self.temperature.value = 23.5f;
    self.sliderResults.text = [NSString stringWithFormat:@"On startup, the temperature was set to %1.2f", self.temperature.value];
    
    // Initial state of the switch
    // Notice the handling of a BOOL
    self.activateAudio.on = NO;
    // ...or...
    [self.activateAudio setOn:NO animated:YES];
    self.switchResults.text = [NSString stringWithFormat:@"On startup, switch is %@", self.activateAudio.on ? @"ON" : @"OFF"];
    
    // Initial state of the stepper
    self.ageSelector.value = 25.0f;
    self.stepperResults.text = [NSString stringWithFormat:@"Startup: %1.0f", self.ageSelector.value];
    
    // Set the image in the UIImageView
    self.myPhoto.image = [UIImage imageNamed:@"peter.png"];
    CGSize imageSize = [self.myPhoto.image size];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)itemSelectionChanged:(UISegmentedControl *)sender {
    
    // Update the label with info from the selected segment
    self.segmentResults.text = [NSString stringWithFormat:@"Segment index %d (of %d), labelled '%@', was selected", sender.selectedSegmentIndex, sender.numberOfSegments, [sender titleForSegmentAtIndex:sender.selectedSegmentIndex]];
}

- (IBAction)temperatureChanged:(UISlider *)sender {
    
    // Update the label with info from the slider
    self.sliderResults.text = [NSString stringWithFormat:@"Slider value changed to %1.2f (min %1.0f, max %1.0f)", sender.value, sender.minimumValue, sender.maximumValue];
}

- (IBAction)switchTapped:(UISwitch *)sender {
    
    // Update the label with info from the switch
    self.switchResults.text = [NSString stringWithFormat:@"Switch is now %@", sender.on ? @"ON" : @"OFF"];
}

- (IBAction)adjustAge:(UIStepper *)sender {
    
    // Update the label with info from the stepper
    if (sender.value > 29) {
        self.stepperResults.text = [NSString stringWithFormat:@"%1.0f (old)",sender.value];
    } else {
        self.stepperResults.text = [NSString stringWithFormat:@"%1.0f (young)",sender.value];
    }
}

@end
