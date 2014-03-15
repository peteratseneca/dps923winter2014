//
//  Login.m
//  Login
//
//  Created by Peter McIntyre on 2014-03-15.
//  Copyright (c) 2014 Seneca College. All rights reserved.
//

#import "Login.h"
#import "EntityList.h"

@interface Login ()

@end

@implementation Login

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - User operations

- (IBAction)login:(UIButton *)sender
{
    // Dismiss keyboard, clear existing login status message
    [self.view endEditing:YES];
    self.loginStatus.text = @"";
    
    BOOL isUsernameOK;
    BOOL isPasswordOK;

    // Compare username - case insensitive
    isUsernameOK = [self.username.text caseInsensitiveCompare:@"peter"] == NSOrderedSame;
    // Compare password - case DOES matter
    isPasswordOK = [self.password.text isEqualToString:@"password"];

    if (isUsernameOK & isPasswordOK)
    {
        // Update the user
        [self.activity startAnimating];
        self.loginStatus.text = @"Login in progress...";

        // Clean up the user interface
        self.username.text = @"";
        self.password.text = @"";
        self.loginStatus.text = @"";
        [self.activity stopAnimating];

        // Segue to the next scene
        [self performSegueWithIdentifier:@"toEntityList" sender:self];
    }
    else
    {
        self.password.text = @"";
        self.loginStatus.text = @"Invalid credentials";
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"toEntityList"])
    {
        EntityList *vc = (EntityList *)[segue destinationViewController];
        vc.model = self.model;
        vc.title = @"Success";
    }
}

@end
