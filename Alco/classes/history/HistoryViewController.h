//
//  FirstViewController.h
//  Alco
//
//  Created by Михаил Вакуленко on 01.06.13.
//  Copyright (c) 2013 peacock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SVSegmentedControl.h"
#import "Data.h"
#import "NSManagedObjectContext+insert.h"

@interface HistoryViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>{
	
	IBOutlet UIImageView *plotImg;
	IBOutlet UITableView *tableView2;
}

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;

@end
