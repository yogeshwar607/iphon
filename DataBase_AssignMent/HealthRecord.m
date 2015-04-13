//
//  HealthRecord.m
//  DataBase_AssignMent
//
//  Created by Rajesh on 11/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "HealthRecord.h"

@implementation HealthRecord
@synthesize recordDate,recordId,recordType,recordValue;

-(id)initWithRecordId:(int)recordId andRecordType:(NSString *)recordType andRecordValue:(double)recordValue andRecordDate:(NSString *)recordDate
{
    self=[super init];
    self->recordId=recordId;
    self->recordDate=recordDate;
    self->recordType=recordType;
    self->recordValue=recordValue;
    
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"%d,%@,%lf,%@",recordId,recordType,recordValue,recordDate];
}
@end
