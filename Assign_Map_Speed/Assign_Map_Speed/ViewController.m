//
//  ViewController.m
//  Assign_Map_Speed
//
//  Created by Rajesh on 18/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize locManager,lableLocation;
- (void)viewDidLoad {
   
    
    // Do any additional setup after loading the view, typically from a nib.
    // init location manager and starts reading location
    locManager=[[CLLocationManager alloc]init];
    [locManager startUpdatingLocation];
    [locManager requestAlwaysAuthorization];
    [locManager requestWhenInUseAuthorization];
    locManager.delegate=self;
    
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *currentLoc=[locations lastObject];
    CLLocationCoordinate2D cord=currentLoc.coordinate;
    
    NSString *loc =[NSString stringWithFormat:@"%f %f",cord.latitude,cord.longitude];
    //  NSLog(@"%@",loc);
    //   lableLocation.text=loc;
    
    float speed=[currentLoc speed];
    
     NSLog(@"%f",speed);
    
    if(speed<6)
    {
        lableLocation.textColor=[UIColor greenColor];
    }
    
    if(speed>=6)
    {
        lableLocation.textColor=[UIColor redColor];
    }
    
    
    // [lableLocation sizeToFit];
}


@end
