//
//  TrackerViewController.m
//  iBeaconDemo
//
//  Created by Sagar Gondaliya on 4/28/15.
//  Copyright (c) 2015 Sagar Gondaliya. All rights reserved.
//

#define kUUID         @"24FC0FB1-A394-4831-B9C5-AD7B8F6EFC98"
#define KMajorId      1
#define KMinorId      1
#define kIdentity     @"zymr.iBeaconDemo"

#import "TrackerViewController.h"

@interface TrackerViewController ()

@end

@implementation TrackerViewController
@synthesize beaconRegion, locationManager;
@synthesize lblAccuracy,lblDeviceFound,lblDistance,lblMajorID,lblMinorID,lblProximityUUID,lblRSSI;

- (void)viewDidLoad {
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    if ([locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [locationManager requestAlwaysAuthorization];
    }
    [self initRegion];
    
    //Comment this below method for real time testing on based of distance
    [self locationManager:locationManager didStartMonitoringForRegion:beaconRegion];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helper Methods

- (void) initRegion{
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:kUUID];
    beaconRegion = [[CLBeaconRegion alloc]initWithProximityUUID:uuid major:KMajorId minor:KMinorId identifier:kIdentity];
    [locationManager startMonitoringForRegion:beaconRegion];
}

#pragma mark - CLLocationManager Delegate Methods

-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region{
    [locationManager startRangingBeaconsInRegion:beaconRegion];
}


-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region{
    [locationManager stopRangingBeaconsInRegion:beaconRegion];
    lblDeviceFound.text = @"No";
}

-(void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region{
    CLBeacon *beacon = [[CLBeacon alloc]init];
    beacon = [beacons lastObject];
    
    lblDeviceFound.text = @"Yes";
    lblProximityUUID.text = beacon.proximityUUID.UUIDString;
    lblMajorID.text = [NSString stringWithFormat:@"%@",beacon.major];
    lblMinorID.text = [NSString stringWithFormat:@"%@",beacon.minor];
    lblAccuracy.text = [NSString stringWithFormat:@"%f",beacon.accuracy];
    if(beacon.proximity == CLProximityUnknown){
        lblDistance.text = @"Unknown Proximity";
    }else if (beacon.proximity == CLProximityImmediate){
        lblDistance.text = @"Immediate";
    }else if (beacon.proximity == CLProximityNear){
        lblDistance.text = @"Near";
    }else if (beacon.proximity == CLProximityFar){
        lblDistance.text = @"Far";
    }
    lblRSSI.text = [NSString stringWithFormat:@"%li",(long)beacon.rssi];
}

-(void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region{
    [locationManager startRangingBeaconsInRegion:beaconRegion];
}

@end
