//
//  ViewController.h
//  TextView Edit
//
//  Created by Peter McIntyre on 1/19/2014.
//  Copyright (c) 2014 School of ICT, Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextViewDelegate>

// Add <UITextViewDelegate> to the @interface declaration, above

// On the storyboard scene, Control+Click-Drag from the text view to the view controller (icon)
// in the dock below the scene; then select "delegate" from the popup

// Finally, in the .m implementation, add the delegate methods that you want to work with

@property (weak, nonatomic) IBOutlet UITextView *courseDescription;

- (IBAction)doneEditing:(UIButton *)sender;

@end
