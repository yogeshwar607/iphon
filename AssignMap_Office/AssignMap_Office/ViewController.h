//
//  ViewController.h
//  AssignMap_Office
//
//  Created by Rajesh on 18/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>




#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate,UIGestureRecognizerDelegate>
@property NSMutableDictionary *dOfficeInfo;
-(void)copyPlistToDocFolder;

@property (weak, nonatomic) IBOutlet MKMapView *myMapView;
@property CLLocationManager* locManager;
@property (weak, nonatomic) IBOutlet UILabel *lableDistance;

-(void)mapFunctionality;

@end

