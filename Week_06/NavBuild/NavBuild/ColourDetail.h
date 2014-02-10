//
//  ColourDetail.h
//  NavBuild
//
//  Created by Peter McIntyre on 2014-02-10.
//  Copyright (c) 2014 School of ICT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColourDetail : UIViewController

@property (nonatomic, copy) NSString *colourName;

@property (weak, nonatomic) IBOutlet UILabel *colorDetailLabel;

@end
