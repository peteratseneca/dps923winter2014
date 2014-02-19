//
//  ProfessorList.h
//  CD 1
//
//  Created by Peter McIntyre on 2/19/2014.
//  Copyright (c) 2014 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfessorList : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) Model *model;
    
@end
