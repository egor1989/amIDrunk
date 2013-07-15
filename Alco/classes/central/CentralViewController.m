//
//  SecondViewController.m
//  Alco
//
//  Created by Михаил Вакуленко on 01.06.13.
//  Copyright (c) 2013 peacock. All rights reserved.
//

#import "CentralViewController.h"

@interface CentralViewController ()

@end

@implementation CentralViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_progressView.trackImage = [UIImage imageNamed:@"central_redSliderBackground"] ;
	_progressView.progressImage = [[UIImage imageNamed:@"central_redSliderForeground"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 16, 10, 16) ];

	currentState = DeviceStateHeating;
	[_progressView setProgress:0.8 animated:YES];
	[self.view addSubview:_progressView];
	
	id appDelegate = (id)[[UIApplication sharedApplication] delegate];
	_managedObjectContext = [appDelegate managedObjectContext];
	
	_bleCommunicator = [[BLECommunication alloc] init] ;
	
	[self newDataFromDeviceWithState:DeviceStateHeating andNumber:10];
	[self newDataFromDeviceWithState:DeviceStateHeating andNumber:10];
	[self newDataFromDeviceWithState:DeviceStateHeating andNumber:10];
	[self newDataFromDeviceWithState:DeviceStateHeating andNumber:10];
	[self newDataFromDeviceWithState:DeviceStateHeating andNumber:10];


	for (int i = 0; i<10; i++) {
	}
}

-(void) newDataFromDeviceWithState:(DeviceStateType)state andNumber:(int)number{
	switch (state) {
		case DeviceStateOff:
			//			[_bleCommunicator setDeviceState:DeviceStateOn];
			break;
		case DeviceStateHeating:
			if (currentState == DeviceStateHeating) {
				[_progressView setProgress:number animated:YES];
			}else{
				currentState = DeviceStateHeating;
				_progressView.trackImage = [UIImage imageNamed:@"central_redSliderBackground"] ;
				_progressView.progressImage = [[UIImage imageNamed:@"central_redSliderForeground"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 16, 10, 16) ];
				[_progressView setProgress:0 animated:YES];
			}
			break;
		case DeviceStateReady:
			if (currentState != DeviceStateReady) {
				currentState = DeviceStateReady;
				_progressView.trackImage = [UIImage imageNamed:@"central_greenSliderBackground"] ;
				_progressView.progressImage = [[UIImage imageNamed:@"central_greenSliderForeground"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 16, 10, 16) ];
				[_progressView setProgress:0 animated:YES];
			}
			break;
		case DeviceStateAnalyzing:
			if (currentState == DeviceStateAnalyzing) {
				[_progressView setProgress:number animated:YES];
			}else{
				currentState = DeviceStateAnalyzing;
				_progressView.trackImage = [UIImage imageNamed:@"central_greenSliderBackground"] ;
				_progressView.progressImage = [[UIImage imageNamed:@"central_greenSliderForeground"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 16, 10, 16) ];
				[_progressView setProgress:number animated:YES];
			}
			break;
		case DeviceStateCalculated:{
			Data *newData = [_managedObjectContext insertNewEntityWithName:@"Data"];
			newData.ppm = number;
			NSDate *date = [NSDate date];
			newData.timestamp = [date timeIntervalSince1970];
#warning Сделать ResultView
			//			[self showResultView]; segue to ResultViwq
			break;
		}
		default:
			break;
	}
}

@end
