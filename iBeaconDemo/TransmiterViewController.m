//
//  TransmiterViewController.m
//  iBeaconDemo
//
//  Created by Sagar Gondaliya on 4/28/15.
//  Copyright (c) 2015 Sagar Gondaliya. All rights reserved.
//

#define kUUIDOfTransmitter         @"24FC0FB1-A394-4831-B9C5-AD7B8F6EFC98"
#define KMajorIdOfTransmitter      1
#define KMinorIdOfTransmitter      1
#define kIdentityOfTransmitter     @"zymr.iBeaconDemo"

#import "TransmiterViewController.h"

@interface TransmiterViewController ()

@end

@implementation TransmiterViewController
@synthesize lblIdentity,lblMajorID,lblMinorID,lblUUID,btnStartAdvertising,beaconPeripheralData,beaconRegion,peripheralManager;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBeacon];
    [self setUpLabelValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBAction Methods
- (IBAction)startAdevertisingBtnTapped:(id)sender {
    beaconPeripheralData = [beaconRegion peripheralDataWithMeasuredPower:nil];
    peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil options:nil];
}

#pragma mark - Helper Methods

-(void)initBeacon{
    NSUUID *uuid = [[NSUUID alloc]initWithUUIDString:kUUIDOfTransmitter];
    beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid major:KMajorIdOfTransmitter minor:KMinorIdOfTransmitter identifier:kIdentityOfTransmitter];
}

-(void)setUpLabelValue{
    lblUUID.text = beaconRegion.proximityUUID.UUIDString;
    lblMajorID.text = [NSString stringWithFormat:@"%@",beaconRegion.major];
    lblMinorID.text = [NSString stringWithFormat:@"%@",beaconRegion.minor];
    lblIdentity.text = beaconRegion.identifier;
}


#pragma mark - CBPeripherealManager Delegate Methods
-(void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral{
    if(peripheral.state == CBPeripheralManagerStatePoweredOn){
        NSLog(@"Powered On");
        [peripheralManager startAdvertising:beaconPeripheralData];
    }else if (peripheral.state == CBPeripheralManagerStatePoweredOff){
        NSLog(@"Powered Off");
        [peripheralManager stopAdvertising];
    }
}

@end
