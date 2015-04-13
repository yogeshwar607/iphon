//
//  OfficeDetail.m
//  AssignMap_Office
//
//  Created by Rajesh on 18/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "OfficeDetail.h"

@implementation OfficeDetail
@synthesize lati,longi,address,distance;

-(id)initWithAddress:(NSString *)address andLatitude:(double)lati andLongitude:(double)longi andDistance:(NSString *)distance
{
    self=[super init];
    self->address=address;
    self->lati=lati;
    self->longi=longi;
    self->distance=distance;
    return self;
}
@end
