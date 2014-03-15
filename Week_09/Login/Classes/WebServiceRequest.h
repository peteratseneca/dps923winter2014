//
//  WebServiceRequest.h
//
//  Created by Peter McIntyre on 2014-03-14.
//  Copyright (c) 2014 Seneca College. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebServiceRequest : NSObject

@property (nonatomic, copy) NSString *urlBase;
@property (nonatomic, copy) NSString *urlPath;
@property (nonatomic, copy) NSString *httpMethod;
@property (nonatomic, copy) NSString *headerAccept;
@property (nonatomic, copy) NSString *headerContentType;
@property (nonatomic, copy) NSString *headerAuthorization;
@property (nonatomic, copy) id messageBody;

- (void)sendRequestToUrlPath:(NSString *)urlPath forDataKeyName:(NSString *)dataKeyName from:(id)sender propertyNamed:(NSString *)propertyName;

// maybe add another custom initializer
// init with base url and data key name

// maybe... also allow for nested json, or a json navigation path

// maybe... also allow a block to be passed in, to process the return results

@end
