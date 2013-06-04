//
//  SecondViewController.m
//  Alco
//
//  Created by Михаил Вакуленко on 01.06.13.
//  Copyright (c) 2013 peacock. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	
	_progressView.trackImage = [UIImage imageNamed:@"central_redSliderBackground"] ;
	_progressView.progressImage = [[UIImage imageNamed:@"central_redSliderForeground"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 16, 10, 16) ];
	[_progressView setProgress:0.8 animated:YES];
	[self.view addSubview:_progressView];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
