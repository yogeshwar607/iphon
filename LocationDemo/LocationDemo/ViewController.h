//
//  ViewController.h
//  LocationDemo
//
//  Created by Rajesh on 18/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lableLocation;
@property CLLocationManager *locManager;

- (IBAction)onShowAddres:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lableAddress;
@property NSString *geoCodeURL;
@end

