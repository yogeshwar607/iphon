//
//  Restaurents.h
//  MapDemo
//
//  Created by Rajesh on 18/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface Restaurents : NSObject<MKAnnotation>
@property NSString *type,*details;

-(id)initWithTitle :(NSString *)title andCoordinate:(CLLocationCoordinate2D)coordinate ansType:(NSString *)type abdDetails:(NSString *)details;




@end
