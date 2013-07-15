//
//  ViewController.m
//  BlueClient
//
//  Created by Mike on 17.02.13.
//  Copyright (c) 2013 Mike. All rights reserved.
//

#import "BLECommunication.h"

@interface BLECommunication ()

@end

static NSString * const kServiceUUID = @"F9266FD7-EF07-45D6-8EB6-BD74F13620F9";
//static NSString * const kServiceUUID = @"312700E2-E798-4D5C-8DCF-49908332DF9F";
static NSString * const kCharacteristicUUID1 = @"4585C102-7784-40B4-88E1-3CB5C4FD37A3";
static NSString * const kCharacteristicUUID3 = @"E788D73B-E793-4D9E-A608-2F2BAFC59A00";

@implementation BLECommunication


- (id)init
{
    self = [super init];
    if (self) {
		self.manager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    }
    return self;
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    switch (central.state) {
        case CBCentralManagerStatePoweredOn:
            // Scans for any peripheral
            ALog(@"start Scaning");
//            [self.manager scanForPeripheralsWithServices:@[ [CBUUID UUIDWithString:kServiceUUID] ] options:@{CBCentralManagerScanOptionAllowDuplicatesKey : @YES }];
//            [self.manager scanForPeripheralsWithServices:@[ [CBUUID UUIDWithString:@"6d480f49-91d3-4a18-be29-0d27f4109c23"] ] options:@{CBCentralManagerScanOptionAllowDuplicatesKey : @YES }];
            
            
            [self.manager scanForPeripheralsWithServices:@[ [CBUUID UUIDWithString:@"F9266FD7-EF07-45D6-8EB6-BD74F13620F9"] ] options:@{CBCentralManagerScanOptionAllowDuplicatesKey : @YES }];
            break;
        default:
            NSLog(@"Central Manager did change state");
            break;
    }
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI {
    // Stops scanning for peripheral
    ALog(@"peripheral discovered");
    [self.manager stopScan];
    if (self.peripheral != peripheral) {
        self.peripheral = peripheral;
        NSLog(@"Connecting to peripheral %@", peripheral);
        NSLog(@"peripheral uuid = %@", peripheral.UUID);
        NSLog(@"peripheral name = %@", peripheral.name);
        NSLog(@"peripheral RSSI = %@", peripheral.RSSI);
        NSLog(@"peripheral isConnected = %d", peripheral.isConnected);
        NSLog(@"peripheral services = %@", peripheral.services);
        // Connects to the discovered peripheral
        [self.manager connectPeripheral:peripheral options:@{CBConnectPeripheralOptionNotifyOnNotificationKey: @1}];
    }
}

- (void)peripheral:(CBPeripheral *)aPeripheral didDiscoverServices:(NSError *)error {
    ALog(@"");
    if (error) {
        NSLog(@"Error discovering service: %@", [error localizedDescription]);
        //[self cleanup];
        return;
    }
    
    for (CBService *service in aPeripheral.services) {
        NSLog(@"Service found with UUID: %@", service.UUID);
        
        // Discovers the characteristics for a given service
        if ([service.UUID isEqual:[CBUUID UUIDWithString:kServiceUUID]]) {
            [self.peripheral discoverCharacteristics:@[[CBUUID UUIDWithString:kCharacteristicUUID1]] forService:service];
        }
    }
}

- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error {
    ALog(@"");
    if (error) {
        NSLog(@"Error discovering characteristic: %@", [error localizedDescription]);
        //[self cleanup];
        return;
    }
    if ([service.UUID isEqual:[CBUUID UUIDWithString:kServiceUUID]]) {
        for (CBCharacteristic *characteristic in service.characteristics) {
            if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:kCharacteristicUUID1]]) {
                [self.peripheral setNotifyValue:YES forCharacteristic:characteristic];
            }
            if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:kCharacteristicUUID3]]) {
//                ch3 = [CBCharacteristic alloc];
//                ch3 = [characteristic copy];
                ch3 = characteristic;
//                NSString* str = @"S";
//                NSData* data = [str dataUsingEncoding:NSUTF8StringEncoding];
//                [self.peripheral writeValue:data forCharacteristic:characteristic type:CBCharacteristicWriteWithResponse];
//                NSLog(@"writen");
            }
        }
    }
}

- (void) peripheral:(CBPeripheral *)peripheral didWriteValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error{
    ALog(@"");
    if (error) {
        NSLog(@"Error writing characteristic: %@", [error localizedDescription]);
        //[self cleanup];
        return;
    }
    
    NSLog(@"characteristic written _value = %@", characteristic.value);

}

- (void)peripheral:(CBPeripheral *)peripheral didUpdateNotificationStateForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error {
    ALog(@"character = %@", characteristic);
    NSLog(@"characteristic _service = %@", characteristic.service);
//    NSLog(@"characteristic _properties = %@", characteristic.properties);
    NSLog(@"characteristic _value = %@", characteristic.value);
    NSLog(@"characteristic uuid = %@", characteristic.UUID);
    NSLog(@"characteristic _descriptors = %@", characteristic.descriptors);
    NSLog(@"characteristic _isBroadcasted = %d", characteristic.isBroadcasted);
    NSLog(@"characteristic _isNotifying = %d", characteristic.isNotifying);
    if (error) {
        NSLog(@"Error changing notification state: %@", error.localizedDescription);
    }
    
    // Exits if it's not the transfer characteristic
    if (![characteristic.UUID isEqual:[CBUUID UUIDWithString:kCharacteristicUUID1]]) {
        return;
    }
    
    // Notification has started
    if (characteristic.isNotifying) {
        NSLog(@"Notification began on %@", characteristic);
        [peripheral readValueForCharacteristic:characteristic];
        
    } else { // Notification has stopped
        // so disconnect from the peripheral
        NSLog(@"Notification stopped on %@.  Disconnecting", characteristic);
        [self.manager cancelPeripheralConnection:self.peripheral];
    }
}

- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error{
    NSString *valueString = [[NSString alloc] initWithData:characteristic.value encoding:NSUTF8StringEncoding];
    
    
//    valueString = [valueString stringByReplacingOccurrencesOfString:@"z" withString:@"/0"];
//    valueString = [valueString stringByReplacingCharactersInRange:NSMakeRange(1, 9) withString:@""];
//    NSString *valueString = [[NSString alloc] initWithCString:characteristic.value encoding:NSASCIIStringEncoding];
    if ([valueString isEqualToString: @"ready"]) {
        _labelStatus.text = valueString;
    }else if ([valueString isEqualToString:@"heatg"]){
        _labelStatus.text = valueString;
    }else if ([valueString isEqualToString:@"sniff"]){
        _labelStatus.text = valueString;
    }else if ([valueString isEqualToString:@"offff"]){
        _labelStatus.text = valueString;
    }else {
        NSLog(@"else");
        _labelNumber.text = valueString;
    }
    ALog(@"characteristic.value = %@", valueString  );
}


- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral {
    ALog(@"connected to peripheral");
    // Clears the data that we may already have
    [self.data setLength:0];
    // Sets the peripheral delegate
    [self.peripheral setDelegate:self];
    // Asks the peripheral to discover the service
    [self.peripheral discoverServices:@[ [CBUUID UUIDWithString:kServiceUUID] ]];
}

- (IBAction)startDeviceAction:(id)sender {
    NSString* str = @"S";
    NSData* data = [str dataUsingEncoding:NSUTF8StringEncoding];
    [self.peripheral writeValue:data forCharacteristic:ch3 type:CBCharacteristicWriteWithResponse];
    NSLog(@"writen data = %@",str);
}

- (IBAction)finishDeviceAction:(id)sender {
    NSString* str = @"F";
    NSData* data = [str dataUsingEncoding:NSUTF8StringEncoding];
    [self.peripheral writeValue:data forCharacteristic:ch3 type:CBCharacteristicWriteWithResponse];
    NSLog(@"writen data = %@", str);
}

- (IBAction)blowDeviceAction:(id)sender {
    NSString* str = @"B";
    NSData* data = [str dataUsingEncoding:NSUTF8StringEncoding];
    [self.peripheral writeValue:data forCharacteristic:ch3 type:CBCharacteristicWriteWithResponse];
    NSLog(@"writen data = %@", str);

}

#pragma mark control commands

- (void)setDeviceState:(DeviceStateType)state{
	switch (state) {
		case DeviceStateOff:
			//make device off
			break;
		case DeviceStateOn:
			//make device on
			break;
			
		default:
			break;
	}
}


@end
