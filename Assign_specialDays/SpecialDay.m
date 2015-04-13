//
//  SpecialDay.m
//  Assign_specialDays
//
//  Created by Rajesh on 15/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "SpecialDay.h"

@implementation SpecialDay
@synthesize name,email,contactNo,dayType,date,imageName;
-(id)initWithName:(NSString *)name andEmail:(NSString *)email andContactNo:(NSString *)contactNo andDayType:(NSString *)dayType andDate:(NSString *)date andImageName:(NSString *)imageName
{
    self->name=name;
    self->email=email;
    self->contactNo=contactNo;
    self->dayType=dayType;
    self->date=date;
    self->imageName=imageName;
    return self;
}
@end
