//
//  ViewController.m
//  LocationDemo
//
//  Created by Rajesh on 18/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize locManager,lableLocation,lableAddress,geoCodeURL;
- (void)viewDidLoad {
    [super viewDidLoad];
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
    
   NSString *loc =[NSString stringWithFormat:@"%f,%f",cord.latitude,cord.longitude];
    NSLog(@"%@",loc);
    lableLocation.text=loc;
  
   
    
  //  NSLog(@"%ld",[currentLoc speed]);
    
    [lableLocation sizeToFit];
    
    
    // create geocoder url
    
    geoCodeURL=@"https://maps.googleapis.com/maps/api/geocode/json?latlng=";
    
    geoCodeURL=[NSString stringWithFormat:@"%@%@",geoCodeURL,lableLocation.text];
    
   

    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)onShowAddres:(id)sender {
    
     NSURL *url=[NSURL URLWithString:geoCodeURL];
    
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    NSOperationQueue *q=[[NSOperationQueue alloc]init];
    
    [NSURLConnection sendAsynchronousRequest:request queue:q completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        // covert json data
        NSError *jsonError;
        
     NSMutableDictionary *mainDict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&jsonError];
        
        // get result array from main object
        
        NSMutableArray *array=[mainDict objectForKey:@"results"];
        
        // get all address objects
        
        for (int i=0; i<[array count]; i++) {
            NSMutableDictionary *addDict=[array objectAtIndex:i];
            
            NSString *address=[addDict objectForKey:@"formatted_address"];
            
            NSLog(@"address:%@",address);
            if(i==0)
            {
                lableAddress.text=address;
                [lableAddress sizeToFit];
            }
        }
        
        
        
        
    }];
    
    
    
    
}
@end
