//
//  StatusViewController.m
//  Alco
//
//  Created by Михаил Вакуленко on 04.06.13.
//  Copyright (c) 2013 peacock. All rights reserved.
//

#import "StatusViewController.h"
#import "Page1ForScrollViewController.h"
#import "Page2ForScrollViewController.h"

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
	_pageControl.imageNormal = [UIImage imageNamed:@"status_pin.png"];
    _pageControl.imageCurrent = [UIImage imageNamed:@"status_pinSelected.png"];
	_scrollView.frame = CGRectMake(0, 0, 292, 92);
	_scrollView.backgroundColor = [UIColor clearColor];

	pageViewManager = [[PageViewManager alloc] initWithScrollView:_scrollView pageControl:_pageControl];

	Page1ForScrollViewController *pc1 = [[[NSBundle mainBundle] loadNibNamed:@"Page1ForScrollViewController" owner:self options:nil]objectAtIndex:0] ;
	Page2ForScrollViewController *pc2 = [[[NSBundle mainBundle] loadNibNamed:@"Page2ForScrollViewController" owner:self options:nil]objectAtIndex:0] ;
    NSArray *array = [NSArray arrayWithObjects:pc1, pc2, nil];
    [pageViewManager loadPages:array];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
