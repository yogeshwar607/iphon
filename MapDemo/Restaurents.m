//
//  Restaurents.m
//  MapDemo
//
//  Created by Rajesh on 18/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "Restaurents.h"

@implementation Restaurents
@synthesize title,coordinate,type,details;


-(id)initWithTitle:(NSString *)title andCoordinate:(CLLocationCoordinate2D)coordinate ansType:(NSString *)type abdDetails:(NSString *)details
{
    self=[super init];
    self->title=title;
    self->details=details;
    self->coordinate=coordinate;
    self->type=type;
    
    return self;
}


@end
