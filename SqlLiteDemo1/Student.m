//
//  Student.m
//  SqlLiteDemo1
//
//  Created by Rajesh on 11/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "Student.h"

@implementation Student
@synthesize name,marks,subcode,rollno;

-(id)initWithName:(NSString *)name andRollNo:(int)rollno andMArks:(double)marks andSubCode:(NSString *)subcode
{
    self=[super init];
    
    self->rollno=rollno;
    self->marks=marks;
    self->name=name;
    self->subcode=subcode;
    
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"%@",name];
}

@end
