//
//  Login.m
//  Login
//
//  Created by Peter McIntyre on 2014-03-15.
//  Copyright (c) 2014 Seneca College. All rights reserved.
//

#import "Login.h"
#import "EntityList.h"
#import "WebServiceRequest.h"

@interface Login ()

@end

@implementation Login

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Register for a notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginResult:) name:@"Login_authToken_fetch_completed" object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // This method will run when the app is launched for the first time,
    // but more importantly, when the user navigates back here
    // In that situation, we WANT to clear the authorization token
    
    // Clear any existing token
    self.authToken = @"";
    self.model.authToken = @"";
}

#pragma mark - Notifications

- (void)loginResult:(NSNotification *)notification
{
    // If the login attempt was successful...
    if ([self.authToken length] > 0)
    {
        // Clean up the user interface
        self.username.text = @"";
        self.password.text = @"";
        self.loginStatus.text = @"";
        [self.activity stopAnimating];
        
        // Save the token
        self.model.authToken = self.authToken;
        //NSLog(@"\nauthToken: %@", self.model.authToken);
        
        // Segue to the next scene
        [self performSegueWithIdentifier:@"toEntityList" sender:self];
    }
    else
    {
        self.password.text = @"";
        self.loginStatus.text = @"Invalid credentials";
        [self.activity stopAnimating];
    }
    [self.loginButton setEnabled:YES];

}

#pragma mark - User operations

- (IBAction)loginRequest:(UIButton *)sender
{
    // Dismiss keyboard
    [self.view endEditing:NO];
    
    // Make sure the user has entered something for both username and password
    if (self.username.text.length > 0 & self.password.text.length > 0)
    {
        // Update the user
        [self.activity startAnimating];
        self.loginStatus.text = @"Login in progress...";
        [self.loginButton setEnabled:NO];
        
        // Create and configure a login request
        WebServiceRequest *login = [[WebServiceRequest alloc] init];
        login.urlBase = [NSString stringWithFormat:@"http://warp.senecac.on.ca:81/bti420_121a42/mobileappgetaccesstoken.aspx?u=%@&p=%@&l=120", self.username.text, self.password.text];
        
        // Send (execute) the login request (which runs in the background)
        [login sendRequestToUrlPath:@"" forDataKeyName:@"Authorization" from:self propertyNamed:@"authToken"];
    }
    else
    {
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
    }
}

@end
