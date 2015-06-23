//
//  TrackerViewController.h
//  iBeaconDemo
//
//  Created by Sagar Gondaliya on 4/28/15.
//  Copyright (c) 2015 Sagar Gondaliya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface TrackerViewController : UIViewController<CLLocationManagerDelegate>{
    
}

@property (weak, nonatomic) IBOutlet UILabel *lblDeviceFound;
@property (weak, nonatomic) IBOutlet UILabel *lblProximityUUID;
@property (weak, nonatomic) IBOutlet UILabel *lblMajorID;
@property (weak, nonatomic) IBOutlet UILabel *lblMinorID;
@property (weak, nonatomic) IBOutlet UILabel *lblAccuracy;
@property (weak, nonatomic) IBOutlet UILabel *lblDistance;
@property (weak, nonatomic) IBOutlet UILabel *lblRSSI;

@property (strong, nonatomic) CLBeaconRegion *beaconRegion;
@property (strong, nonatomic) CLLocationManager *locationManager;


@end
