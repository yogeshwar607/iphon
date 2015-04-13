//
//  ViewController.m
//  AssignMap_Office
//
//  Created by Rajesh on 18/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"
#import "OfficeDetail.h"

@interface ViewController ()
{
    NSNumber  *latiDelhi;
    NSNumber  *longDelhi;
    
    NSNumber  *latiChennai;
    NSNumber  *latiPune;
    NSNumber *latiKolkata;
    NSNumber *latiHyd;
    NSNumber  *longChennai;
    NSNumber  *longPune;
    NSNumber *longKolkata;
    NSNumber *longHyd;
}
@end
static NSString *pListPath;
@implementation ViewController
@synthesize dOfficeInfo,myMapView,locManager,lableDistance;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self copyPlistToDocFolder];
    
    // read data from plist
    
    NSData *plistData=[NSData dataWithContentsOfFile:pListPath];
    
    NSPropertyListFormat format;
    NSError *error;
    
    
    dOfficeInfo=[NSPropertyListSerialization propertyListWithData:plistData options:NSPropertyListMutableContainersAndLeaves format:&format error:&error];
    
   
    
    NSMutableDictionary *cityChennai=[[NSMutableDictionary alloc]initWithDictionary:[dOfficeInfo objectForKey:@"chennai"] copyItems:true];
   
    NSMutableDictionary *cityPune=[[NSMutableDictionary alloc]initWithDictionary:[dOfficeInfo objectForKey:@"pune"] copyItems:true];
    
    NSMutableDictionary *cityDelhi=[[NSMutableDictionary alloc]initWithDictionary:[dOfficeInfo objectForKey:@"delhi"] copyItems:true];

    
    NSMutableDictionary *cityKolkata=[[NSMutableDictionary alloc]initWithDictionary:[dOfficeInfo objectForKey:@"kolkata"] copyItems:true];

    
    NSMutableDictionary *cityHyderabad=[[NSMutableDictionary alloc]initWithDictionary:[dOfficeInfo objectForKey:@"hyderabad"] copyItems:true];


    latiChennai=[cityChennai objectForKey:@"latitude"];
    
     latiDelhi=[cityDelhi objectForKey:@"latitude"];
    
    latiPune=[cityPune objectForKey:@"latitude"] ;
    
     latiKolkata=[cityKolkata objectForKey:@"latitude"];
    
     latiHyd=[cityHyderabad  objectForKey:@"latitude"];
    
    
  longChennai=[cityChennai objectForKey:@"longitude"];
    
   longDelhi=[cityDelhi objectForKey:@"longitude"];
   longPune=[cityPune objectForKey:@"longitude"] ;
    
  longKolkata=[cityKolkata objectForKey:@"longitude"];
  longHyd=[cityHyderabad  objectForKey:@"longitude"];

    
       // location   manager
    
    myMapView.delegate=self;
    
    
    locManager =[[CLLocationManager alloc]init];
    [locManager startUpdatingLocation];
    [locManager requestAlwaysAuthorization];
    [locManager requestWhenInUseAuthorization];
    
    
    
    [myMapView setShowsUserLocation:true];
    [myMapView setMapType:MKMapTypeStandard];
    
    
    CLLocationCoordinate2D centerPoint=CLLocationCoordinate2DMake(28.631123, 77.223144);
    
    MKCoordinateRegion region=MKCoordinateRegionMakeWithDistance(centerPoint, 300000, 300000);
    [myMapView setRegion:region];
    [myMapView setZoomEnabled:true];
    [myMapView setUserInteractionEnabled:true];
    
    
    
    CLLocationCoordinate2D locl1=CLLocationCoordinate2DMake([latiChennai doubleValue],[longChennai doubleValue]);
    CLLocationCoordinate2D locl2=CLLocationCoordinate2DMake( [latiDelhi doubleValue], [longDelhi doubleValue]);
    
    CLLocationCoordinate2D locl3=CLLocationCoordinate2DMake( [latiPune doubleValue], [longPune doubleValue]);
    
    CLLocationCoordinate2D locl4=CLLocationCoordinate2DMake( [latiHyd doubleValue], [longHyd doubleValue]);
    
    CLLocationCoordinate2D locl5=CLLocationCoordinate2DMake( [latiKolkata doubleValue], [longKolkata doubleValue]);
    
    
    
    
    // draw lines connecting two positions
    
    CLLocationCoordinate2D locations1[]={locl2,locl1};
    CLLocationCoordinate2D locations2[]={locl2,locl3};
    CLLocationCoordinate2D locations3[]={locl2,locl4};
    CLLocationCoordinate2D locations4[]={locl2,locl5};
    
    MKPolyline *line1=[MKPolyline polylineWithCoordinates:locations1 count:2];
    MKPolyline *line2=[MKPolyline polylineWithCoordinates:locations2 count:2];
    MKPolyline *line3=[MKPolyline polylineWithCoordinates:locations3 count:2];
    MKPolyline *line4=[MKPolyline polylineWithCoordinates:locations4 count:2];
    
    
    [myMapView addOverlay:line1];
    [myMapView addOverlay:line2];
    [myMapView addOverlay:line3];
    [myMapView addOverlay:line4];

    

    [myMapView showsUserLocation];
    
    
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                         action:@selector(handleGesture:)];
    tgr.numberOfTapsRequired = 1;
    [myMapView addGestureRecognizer:tgr];

    
    
    //  show data in ui
    
    
   // place=[[NSMutableArray alloc]initWithArray:[dPlaceInfo allKeys] copyItems:true];
    
    //   [place addObject:[dPlaceInfo objectForKey:@"berlin"]];
    
  //  NSLog(@"%@",[place objectAtIndex:0]);
    
  //  [self mapFunctionality];
    
    
}


-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
  
    
   
    CLLocation *headOfficeLoc=[[CLLocation alloc]initWithLatitude:[latiDelhi doubleValue]  longitude:[longDelhi doubleValue]];
    
    CLLocationCoordinate2D cord=userLocation.coordinate;
    
    CLLocation *current=[[CLLocation alloc]initWithLatitude:cord.latitude longitude:cord.longitude];
    
    double   userlatitude =cord.latitude;
    double userlongitude = cord.longitude;
    
    
    CLLocationDistance distance=[current distanceFromLocation:headOfficeLoc];
    
    lableDistance.text=[NSString stringWithFormat:@"%.2f km",(distance/1000)];
    
  

    
    
    
}


- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateEnded)
        return;
    
    CGPoint touchPoint = [gestureRecognizer locationInView:myMapView];
    
   CLLocationCoordinate2D coordinate = [myMapView convertPoint:touchPoint toCoordinateFromView:myMapView];
    
    NSLog(@"latitude  %f longitude %f",coordinate.latitude,coordinate.longitude);
    
    
    
    CLLocation *touchLoc=[[CLLocation alloc]initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    
    CLLocation *lDelhi=[[CLLocation alloc]initWithLatitude:[latiDelhi doubleValue]  longitude:[longDelhi doubleValue]];
    
    CLLocation *lPune=[[CLLocation alloc]initWithLatitude:[latiPune doubleValue]  longitude:[longPune doubleValue]];
    CLLocation *lChennai=[[CLLocation alloc]initWithLatitude:[latiChennai doubleValue]  longitude:[longChennai doubleValue]];
    CLLocation *lKolkata=[[CLLocation alloc]initWithLatitude:[latiKolkata doubleValue]  longitude:[longKolkata doubleValue]];
    CLLocation *lHyd=[[CLLocation alloc]initWithLatitude:[latiHyd doubleValue]  longitude:[longHyd doubleValue]];
    
    CLLocationDistance distanceDelhi=[touchLoc distanceFromLocation:lDelhi];

     CLLocationDistance distancePune=[touchLoc distanceFromLocation:lPune];
     CLLocationDistance distanceChennai=[touchLoc distanceFromLocation:lChennai];
     CLLocationDistance distanceKolkata=[touchLoc distanceFromLocation:lKolkata];
     CLLocationDistance distanceHyd=[touchLoc distanceFromLocation:lHyd];
    
    double min=distanceDelhi;
    int pos;
    double arr[5]={distanceChennai,distanceDelhi,distanceHyd,distanceKolkata,distancePune};
    
    for (int i=0; i<5; i++) {
        
        if (min>arr[i]) {
            min=arr[i];
            pos=i;
        }
        
    }
    
    switch (pos) {
        case 0:
             NSLog(@"Nearest office is Chennai %f",min);
            break;
           
        case 1:
            NSLog(@"Nearest office is Delhi %f",min);
            break;

        case 2:
            NSLog(@"Nearest office is Hyderabad %f",min);
            break;

        case 3:
            NSLog(@"Nearest office is Kolkata %f",min);
            break;

        case 4:
            NSLog(@"Nearest office is Pune %f",min);
            break;

            
        default:
            break;
    }
    
}








-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
    
    MKPolylineRenderer *lineRenderer=[[MKPolylineRenderer alloc]initWithPolyline:overlay];
    
    [lineRenderer setStrokeColor:[UIColor blueColor]];
    [lineRenderer setLineWidth:2.0f];
    
    return  lineRenderer;
}


-(void)copyPlistToDocFolder
{
    NSBundle *bundle=[NSBundle mainBundle];
    NSString *plistSourcePath=[bundle pathForResource:@"companydata" ofType:@"plist"];
    
    // create path for plist in doc folder'''
    
    NSArray *pathArray=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true);
    
    NSString *docDirPath=[pathArray objectAtIndex:0];
    
    NSString *plistPathInDocFolder= [docDirPath stringByAppendingPathComponent:@"companydata.plist"];
    
    
    // chexk if file exits
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    BOOL exist=[fileManager fileExistsAtPath:plistPathInDocFolder isDirectory:false];
    
    if(!exist)
    {
        [fileManager copyItemAtPath:plistSourcePath toPath:plistPathInDocFolder error:nil];

    }
    NSLog(@"path at file%@",plistPathInDocFolder);
    pListPath=plistPathInDocFolder;
    
}




@end
