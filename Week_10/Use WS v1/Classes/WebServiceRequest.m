//
//  WebServiceRequest.m
//
//  Created by Peter McIntyre on 2014-03-14.
//  Copyright (c) 2014 Seneca College. All rights reserved.
//

#import "WebServiceRequest.h"

@implementation WebServiceRequest

- (id)init
{
    if (self = [super init])
    {
        _urlBase = @"http://dps907fall2013.azurewebsites.net";
        _httpMethod = @"GET";
        _headerAccept = @"application/json";
        // ########## NEW ##########
        _headerContentType = _headerAccept;
        // ########## NEW ##########
    }
    return self;
}

- (void)sendRequestToUrlPath:(NSString *)urlPath forDataKeyName:(NSString *)dataKeyName from:(id)sender propertyNamed:(NSString *)propertyName
{
    // Assemble the URL
    NSURL *url = [NSURL URLWithString:urlPath relativeToURL:[NSURL URLWithString:self.urlBase]];
    
    // Create a session configuration object
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    // Create a session object
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    
    // Create a request object
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    // Set its important properties
    [request setHTTPMethod:self.httpMethod];
    [request setValue:self.headerAccept forHTTPHeaderField:@"Accept"];
    
    // ########## NEW ##########
    NSString *authToken = [sender valueForKey:@"authToken"];
    if (authToken.length > 0) { self.headerAuthorization = authToken; }
    // ########## NEW ##########
    
    // If an authorization header was configured...
    if (self.headerAuthorization) { [request setValue:self.headerAuthorization forHTTPHeaderField:@"Authorization"]; }
    
    // If a content type header was configured...
    if (self.headerContentType) { [request setValue:self.headerContentType forHTTPHeaderField:@"Content-Type"]; }

    // If a message body was configured...
    if (self.messageBody)
    {
        NSError *messageBodyError;
        NSData *message = [NSJSONSerialization dataWithJSONObject:self.messageBody options:0 error:&messageBodyError];

        if (messageBodyError)
        {
            NSLog(@"\nError creating message body: %@", [messageBodyError description]);
            return;
        }
        
        [request setHTTPBody:message];
    }
    
    // Reference the app's network activity indicator in the status bar
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    // Define a network task; after it's created, it's in a "suspended" state
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        // If there's a request error, display it
        if (error)
        {
            NSLog(@"\nTask request error: %@", [error description]);
        }
        else
        {
            // FYI, show some details about the response
            // This code is interesting during development, but you would not leave it in production/deployed code
            NSHTTPURLResponse *r = (NSHTTPURLResponse *)response;
            NSLog(@"\nResponse data:\nStatus code: %ld\nHeaders:\n%@", (long)r.statusCode, [r.allHeaderFields description]);
            
            // Attempt to deserialize the data from the response
            NSError *jsonError = nil;
            NSDictionary *results = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
            
            if (jsonError)
            {
                NSLog(@"\nJSON deserialization error: %@", [jsonError description]);
            }
            else
            {
                // The request was successful, and deserialization was successful
                // Therefore, extract the data we want from the dictionary
                // and assign it to the passed-in property
                // This version of the code works only with
                // top/first level key-value pairs in the source JSON data
                [sender setValue:results[dataKeyName] forKey:propertyName];
            }
            
            // Next, post a notification for interested listeners
            NSString *completed = [NSString stringWithFormat:@"%@_%@_fetch_completed", [[sender class] description], propertyName];
            [[NSNotificationCenter defaultCenter] postNotificationName:completed object:nil];
        }
        
        // Finally, reference the app's network activity indicator in the status bar
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
    }];
    
    // Resume (which effectively starts) the network task
    [task resume];
}

@end
