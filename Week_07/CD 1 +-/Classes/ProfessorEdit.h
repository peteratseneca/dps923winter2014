//
//  ProfessorEdit.h
//  CD One +
//
//  Created by Peter McIntyre on 2012/07/09.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

// We use the delegate pattern here
// The intention is that this "add" view controller will be presented modally
// It will enable the user to enter data, and then "cancel" or "save"
// Both methods will call a delegate method to process the entered data
// Note that this view controller could also be used to "edit" an existing category

// The protocol's name format should be: Edit____Delegate, where the blank
// is the name of the entity / object that is being edited

@protocol EditProfessorDelegate <NSObject>

// By default, methods are "required"; you can change this by prefacing methods with "@optional"
- (void) EditProfessorController:(id)controller didEditItem:(id)item;

@end





#import <UIKit/UIKit.h>

@interface ProfessorEdit : UIViewController <UITextFieldDelegate>

// This class needs a delegate property
@property (nonatomic, assign) id <EditProfessorDelegate> delegate;

@property (nonatomic, strong) Model *model;
@property (nonatomic, strong) Professor *detailItem;

// User interface
@property (weak, nonatomic) IBOutlet UITextField *fullName;
@property (weak, nonatomic) IBOutlet UITextField *office;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *webSite;
@property (weak, nonatomic) IBOutlet UITextView *errors;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@end
