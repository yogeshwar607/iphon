//
//  HealthRecord.h
//  DataBase_AssignMent
//
//  Created by Rajesh on 11/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HealthRecord : NSObject
@property int recordId;
@property NSString *recordType,*recordDate;
@property double recordValue;

-(id)initWithRecordId :(int)recordId andRecordType :(NSString *)recordType andRecordValue :(double)recordValue andRecordDate :(NSString *)recordDate;


@end
