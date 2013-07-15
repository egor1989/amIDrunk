//
//  ViewController.h
//  BlueClient
//
//  Created by Mike on 17.02.13.
//  Copyright (c) 2013 Mike. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>

typedef NS_ENUM(NSInteger, DeviceStateType) {
	DeviceStateOff,
	DeviceStateReady,
	DeviceStateHeating,
	DeviceStateAnalyzing,
	DeviceStateCalculated,
	DeviceStateOn
};

@protocol BLEDelegate <NSObject>
@optional
-(void) newDataFromDeviceWithState: (DeviceStateType) state andNumber: (int)number;

@end

@interface BLECommunication : NSObject <CBCentralManagerDelegate, CBPeripheralDelegate>{
    CBCharacteristic *ch3;
}

@property (nonatomic, strong) CBCentralManager *manager;
@property (nonatomic, strong) NSMutableData *data;
@property (nonatomic, strong) CBPeripheral *peripheral;

- (IBAction)startDeviceAction:(id)sender;
- (IBAction)finishDeviceAction:(id)sender;
- (IBAction)blowDeviceAction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *labelNumber;
@property (strong, nonatomic) IBOutlet UILabel *labelStatus;

- (void)setDeviceState:(DeviceStateType)state;


@end
