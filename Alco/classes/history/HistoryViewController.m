//
//  FirstViewController.m
//  Alco
//
//  Created by Михаил Вакуленко on 01.06.13.
//  Copyright (c) 2013 peacock. All rights reserved.
//

#import "HistoryViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "HistoryCell.h"

@interface HistoryViewController ()

@end

@implementation HistoryViewController

- (void)viewDidLoad
{
	[self tapBarInit];
	[super viewDidLoad];
	[[tableView2 layer] setCornerRadius:15];
	[self switchInit];
	
	id appDelegate = (id)[[UIApplication sharedApplication] delegate];
    _managedObjectContext = [appDelegate managedObjectContext];
	
	for (int i = 0; i<10; i++) {
		Data *test1 = [_managedObjectContext insertNewEntityWithName:@"Data"];
		test1.ppm = 0.345*i;
		NSDate *date = [NSDate date];
		test1.timestamp = [date timeIntervalSince1970];
	}
	
	
	NSError *error;
	if (![[self fetchedResultsController] performFetch:&error]) {
		// Update to handle the error appropriately.
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		exit(-1);  // Fail
	}

}

- (void) switchInit{
	SVSegmentedControl *navSC = [[SVSegmentedControl alloc] initWithSectionTitles:[NSArray arrayWithObjects:
																			@"           ТАБЛИЦА          ",
																			@"           ГРАФИК            ",
																				   nil]];
	[navSC setBackgroundImage:[UIImage imageNamed:@"history_switchBackground@2x"]];
	navSC.thumb.backgroundImage = [UIImage imageNamed:@"history_switchActiveBackground@2x"];
	navSC.thumb.highlightedBackgroundImage = [UIImage imageNamed:@"history_switchActiveBackgroundOpacity@2x"];
	navSC.height = 44.5;

	navSC.font = [UIFont fontWithName:@"MyriadPro-BoldCond" size:17.0];

	navSC.textShadowColor = [UIColor colorWithRed:255 green:224 blue:201 alpha:0.3];
	navSC.textColor = [UIColor colorWithWhite:0.0 alpha:0.45];
	navSC.textShadowOffset = CGSizeMake(0, 1);

	navSC.thumb.textShadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.75];
	navSC.thumb.textShadowOffset = CGSizeMake(0, 1);
	
	navSC.thumbEdgeInset = UIEdgeInsetsMake(4, 4, 6, 4);
    navSC.changeHandler = ^(NSUInteger newIndex) {
        NSLog(@"segmentedControl did select index %i (via block handler)", newIndex);
		if (newIndex) {
			[UIView animateWithDuration:0.3 animations:^() {
				tableView2.alpha = 0.0;
			} completion:^(BOOL finished) {
				[UIView animateWithDuration:0.3 animations:^() {
					plotImg.alpha = 1.0;
				}];
			}];
		}else{
			[UIView animateWithDuration:0.3 animations:^() {
				plotImg.alpha = 0.0;
			} completion:^(BOOL finished) {
				[UIView animateWithDuration:0.3 animations:^() {
					tableView2.alpha = 1.0;
				}];
			}];
		}
    };
    
	[self.view addSubview:navSC];
	
	navSC.center = CGPointMake(160, 78);
}

-(void) tapBarInit{
	//инициализация tapBar.
    UIImage *selectedImage0 = [UIImage imageNamed:@"tapbar_historyActive"];
    UIImage *unselectedImage0 = [UIImage imageNamed:@"tapbar_historyInactive"];
	
	UIImage *selectedImage1 = [UIImage imageNamed:@"tapbar_centralActive.png"];
    UIImage *unselectedImage1 = [UIImage imageNamed:@"tapbar_centralInactive.png"];
	
    UIImage *selectedImage2 = [UIImage imageNamed:@"tapbar_stateActive.png"];
    UIImage *unselectedImage2 = [UIImage imageNamed:@"tapbar_stateInactive.png"];
    
    UITabBar *tabBar = self.tabBarController.tabBar;
	tabBar.backgroundImage = [UIImage imageNamed:@"tapbar_background.png"];
	
    UITabBarItem *item0 = [tabBar.items objectAtIndex:0];
    UITabBarItem *item1 = [tabBar.items objectAtIndex:1];
    UITabBarItem *item2 = [tabBar.items objectAtIndex:2];
    
    [item0 setFinishedSelectedImage:selectedImage0 withFinishedUnselectedImage:unselectedImage0];
    [item1 setFinishedSelectedImage:selectedImage1 withFinishedUnselectedImage:unselectedImage1];
    [item2 setFinishedSelectedImage:selectedImage2 withFinishedUnselectedImage:unselectedImage2];

}

#pragma mark tableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id  sectionInfo =
	[[_fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}


- (void)configureCell:(HistoryCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    Data *data = [_fetchedResultsController objectAtIndexPath:indexPath];
	cell.promille.text = [NSString stringWithFormat:@"%f",data.ppm];
	cell.place.text = @"Mishka bar";
	cell.date.text = @"25 июня";
	cell.time.text = @"23:20";
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{	
	HistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"historyCell"];
//	cell.promille.text = @"0.372 ‰";
//	cell.place.text = @"Mishka bar";
//	cell.date.text = @"25 июня";
//	cell.time.text = @"23:20";
	[self configureCell:cell atIndexPath:indexPath];
//	if (cell == nil)
//	{
//		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
//									   reuseIdentifier:@"historyCell"];
//	}
	return cell;
}

- (NSFetchedResultsController *)fetchedResultsController {
	
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
	
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
								   entityForName:@"Data" inManagedObjectContext:_managedObjectContext];
    [fetchRequest setEntity:entity];
	
    NSSortDescriptor *sort = [[NSSortDescriptor alloc]
							  initWithKey:@"timestamp" ascending:NO];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
	
    [fetchRequest setFetchBatchSize:20];
	
    NSFetchedResultsController *theFetchedResultsController =
	[[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
										managedObjectContext:_managedObjectContext sectionNameKeyPath:nil
												   cacheName:@"Root"];
    self.fetchedResultsController = theFetchedResultsController;
    _fetchedResultsController.delegate = self;
	
    return _fetchedResultsController;
	
}

#pragma mark nsfetchedDelegateMethods

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    // The fetch controller is about to start sending change notifications, so prepare the table view for updates.
    [tableView2 beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
	
    UITableView *tableView = tableView2;
	
    switch(type) {
			
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
			
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
			
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
			
        case NSFetchedResultsChangeMove:
			[tableView deleteRowsAtIndexPaths:[NSArray
											   arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
			[tableView insertRowsAtIndexPaths:[NSArray
											   arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
			break;
    }
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id )sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
	
    switch(type) {
			
        case NSFetchedResultsChangeInsert:
            [tableView2 insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
			
        case NSFetchedResultsChangeDelete:
            [tableView2 deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    // The fetch controller has sent all current change notifications, so tell the table view to process all updates.
    [tableView2 endUpdates];
}

@end
