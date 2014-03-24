//
//  Login.h
//  Login
//
//  Created by Peter McIntyre on 2014-03-15.
//  Copyright (c) 2014 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Login : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) Model *model;

@property (nonatomic, copy) NSString *authToken;

// User interface
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@property (weak, nonatomic) IBOutlet UILabel *loginStatus;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

// User actions
- (IBAction)loginRequest:(UIButton *)sender;

@end
