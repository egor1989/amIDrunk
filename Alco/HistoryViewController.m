//
//  FirstViewController.m
//  Alco
//
//  Created by Михаил Вакуленко on 01.06.13.
//  Copyright (c) 2013 peacock. All rights reserved.
//

#import "HistoryViewController.h"

@interface HistoryViewController ()

@end

@implementation HistoryViewController

- (void)viewDidLoad
{
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
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
