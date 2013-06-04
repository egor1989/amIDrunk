//
//  StatusViewController.m
//  Alco
//
//  Created by Михаил Вакуленко on 04.06.13.
//  Copyright (c) 2013 peacock. All rights reserved.
//

#import "StatusViewController.h"

@interface StatusViewController ()

@end

@implementation StatusViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	UIView *page;
    _pageControl.imageNormal = [UIImage imageNamed:@"status_pin.png"];
    _pageControl.imageCurrent = [UIImage imageNamed:@"status_pinSelected.png"];
	_scrollView.frame = CGRectMake(0, 0, 320, 350);
	page = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 350)];
    page.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
