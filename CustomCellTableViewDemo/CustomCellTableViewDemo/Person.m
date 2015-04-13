//
//  Person.m
//  CustomCellTableViewDemo
//
//  Created by Rajesh on 08/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "Person.h"

@implementation Person
@synthesize name,age,gender;

-(id)initWithName:(NSString *)name andAge:(int)age andGender:(NSString *)gender
{
    self=[super init];
    self->name=name;
    self->age=age;
    self->gender=gender;
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"%@ : %d : %@",name,age,gender];
}

@end
