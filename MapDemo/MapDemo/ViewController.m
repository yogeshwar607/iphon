//
//  ViewController.m
//  MapDemo
//
//  Created by Rajesh on 18/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"
#import "Restaurents.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myMapView,locManager;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    myMapView.delegate=self;
    
    
    locManager =[[CLLocationManager alloc]init];
    [locManager startUpdatingLocation];
    [locManager requestAlwaysAuthorization];
    [locManager requestWhenInUseAuthorization];
    
    
    
    [myMapView setShowsUserLocation:true];
    [myMapView setMapType:MKMapTypeStandard];
    
    
    CLLocationCoordinate2D centerPoint=CLLocationCoordinate2DMake(18,73);
    
    MKCoordinateRegion region=MKCoordinateRegionMakeWithDistance(centerPoint, 50000, 50000);
    [myMapView setRegion:region];
    [myMapView setZoomEnabled:true];
    [myMapView setUserInteractionEnabled:true];
    
    
    // markers  smokin jone--   18.566264, 73.800915
    //  rahul    18.565857, 73.807009
    //  rushers    18.559877, 73.789886

    
    CLLocationCoordinate2D locl1=CLLocationCoordinate2DMake( 18.566264, 73.800915);
    
     CLLocationCoordinate2D locl2=CLLocationCoordinate2DMake( 18.565857, 73.807009);
    
    CLLocationCoordinate2D locl3=CLLocationCoordinate2DMake( 18.559877, 73.789886);
    
    Restaurents *r1=[[Restaurents alloc]initWithTitle:@"smokin joe" andCoordinate:locl1 ansType:@"Wraps" abdDetails:@"Don't Kow about it"];
    
    Restaurents *r2=[[Restaurents alloc]initWithTitle:@"rahul" andCoordinate:locl2 ansType:@"bar" abdDetails:@"aroma"];
    
    Restaurents *r3=[[Restaurents alloc]initWithTitle:@"rushers" andCoordinate:locl3 ansType:@"cookies" abdDetails:@"blah blah"];

    [myMapView addAnnotation:r1];
    [myMapView addAnnotation:r2];
    [myMapView addAnnotation:r3];
    
    // draw lines connecting two positions
    
    CLLocationCoordinate2D locations[]={locl1,locl2,locl3};
    
    MKPolyline *line=[MKPolyline polylineWithCoordinates:locations count:3];
                       
                       [myMapView addOverlay:line];
    
    
    // add long press gesture
    
    UILongPressGestureRecognizer *longPressGesture=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(onLongPress:)];
    
    longPressGesture.minimumPressDuration=2.0f;
    
    [myMapView addGestureRecognizer:longPressGesture];
    
    
}

-(void)onLongPress:(UILongPressGestureRecognizer *)gesture
{
    if (gesture.state==UIGestureRecognizerStateEnded) {
        
        CGPoint pointOfTouch=[gesture locationInView:myMapView];
      
        CLLocationCoordinate2D coordinate=[myMapView convertPoint:pointOfTouch toCoordinateFromView:myMapView];
        NSLog(@"%f,%f",coordinate.latitude,coordinate.longitude);
        
        
        
    }
    
}

// record current locations

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
   float lat= userLocation.coordinate.latitude;
    float lon= userLocation.coordinate.longitude;

    NSLog(@"current loc:%f,%f",lat,lon);
//    
//    MKCircle *circle=[MKCircle circleWithCenterCoordinate:userLocation.coordinate radius:5];
//                      
//    [myMapView addOverlay:circle];
    
    
    
}



-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    
    MKPolylineRenderer *lineRenderer=[[MKPolylineRenderer alloc]initWithPolyline:overlay];
    
    [lineRenderer setStrokeColor:[UIColor blueColor]];
       [lineRenderer setLineWidth:2.0f];
    
       return  lineRenderer;
}
//-(MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay
//{
//    
//    MKPolylineView *lineView=[[MKPolylineView alloc]initWithPolyline:overlay];
//    [lineView setStrokeColor:[UIColor blueColor]];
//    [lineView setLineWidth:2.0f];
//    
//    return  lineView;
//    
//}


-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    Restaurents *r=[view annotation];
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:r.title message:r.details delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil];
    [alert show];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
