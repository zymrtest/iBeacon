//
//  TransmiterViewController.h
//  iBeaconDemo
//
//  Created by Sagar Gondaliya on 4/28/15.
//  Copyright (c) 2015 Sagar Gondaliya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface TransmiterViewController : UIViewController<CBPeripheralManagerDelegate>{
    
}

@property (weak, nonatomic) IBOutlet UILabel *lblUUID;
@property (weak, nonatomic) IBOutlet UILabel *lblMajorID;
@property (weak, nonatomic) IBOutlet UILabel *lblMinorID;
@property (weak, nonatomic) IBOutlet UILabel *lblIdentity;
@property (weak, nonatomic) IBOutlet UIButton *btnStartAdvertising;


@property (strong, nonatomic) CLBeaconRegion *beaconRegion;
@property (strong, nonatomic) NSDictionary *beaconPeripheralData;
@property (strong, nonatomic) CBPeripheralManager *peripheralManager;

- (IBAction)startAdevertisingBtnTapped:(id)sender;

@end
