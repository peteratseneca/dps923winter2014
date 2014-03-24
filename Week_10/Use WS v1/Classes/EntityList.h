//
//  EntityList.h
//
//  Data source is a fetched results controller
//
//  Created by Peter McIntyre on 2012/10/05.
//  Copyright (c) 2012 Seneca College. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EntityEdit.h"

@interface EntityList : UITableViewController <NSFetchedResultsControllerDelegate, EditEntityDelegate>

@property (nonatomic, strong) Model *model;

@end
