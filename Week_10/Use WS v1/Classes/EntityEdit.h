//
//  EntityEdit.h
//  Use WS v1
//
//  Created by Peter McIntyre on 2014-03-23.
//  Copyright (c) 2014 Seneca College. All rights reserved.
//

// The protocol's name format should be: Edit____Delegate, where the blank
// is the name of the entity / object that is being edited

@protocol EditEntityDelegate <NSObject>

// By default, methods are "required"; you can change this by prefacing methods with "@optional"
- (void) EditEntityController:(id)controller didEditItem:(id)item;

@end





#import <UIKit/UIKit.h>

@interface EntityEdit : UIViewController <UITextFieldDelegate>

// This class needs a delegate property
@property (nonatomic, assign) id <EditEntityDelegate> delegate;

@property (nonatomic, strong) Model *model;
@property (nonatomic, strong) NSDictionary *detailItem;

// User interface
@property (weak, nonatomic) IBOutlet UITextField *itemTitle;
@property (weak, nonatomic) IBOutlet UITextField *itemDescription;
@property (weak, nonatomic) IBOutlet UISegmentedControl *itemType;
@property (weak, nonatomic) IBOutlet UISlider *itemValue;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet UIDatePicker *itemDueDate;

// User actions
- (IBAction)save:(UIBarButtonItem *)sender;
- (IBAction)cancel:(UIBarButtonItem *)sender;

- (IBAction)changedSlider:(UISlider *)sender;
- (IBAction)changedSegment:(UISegmentedControl *)sender;
- (IBAction)changedDatePicker:(UIDatePicker *)sender;

@end
