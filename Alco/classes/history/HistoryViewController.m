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
	[[tableViewGlobal2 layer] setCornerRadius:15];
	[self switchInit];
	

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
    return 3;    //count number of row from counting array hear cataGorry is An Array
}



- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{	
	HistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"historyCell"];
	cell.promille.text = @"0.372 ‰";
	cell.place.text = @"Mishka bar";
	cell.date.text = @"25 июня";
	cell.time.text = @"23:20";
//	if (cell == nil)
//	{
//		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
//									   reuseIdentifier:@"historyCell"];
//	}
	return cell;
}

@end
