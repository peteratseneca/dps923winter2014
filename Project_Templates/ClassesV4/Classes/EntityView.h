//
//  EntityView.h
//
//  Data source is a custom NSManagedObject subclass
//
//  Created by Peter McIntyre on 2012/10/05.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EntityView : UIViewController

// Data for the controller
@property (nonatomic, strong) Model *model;
//@property (nonatomic, strong) EntityName *o;

// User interface
@property (weak, nonatomic) IBOutlet UILabel *attributeName;

@end
