//
//  DetailViewController.h
//  NavTemplate
//
//  Created by Peter McIntyre on 2014-02-10.
//  Copyright (c) 2014 School of ICT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
