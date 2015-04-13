//
//  OfficeDetail.h
//  AssignMap_Office
//
//  Created by Rajesh on 18/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface OfficeDetail : NSObject<MKAnnotation>

@property NSString *address,*distance;
@property double lati, longi;

-(id)initWithAddress: (NSString*)address andLatitude:(double)lati andLongitude:(double)longi andDistance:(NSString*)distance;
@end
