//
//  Student.h
//  SqlLiteDemo1
//
//  Created by Rajesh on 11/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property int rollno;
@property NSString *name,*subcode;
@property double marks;
-(id)initWithName :(NSString *)name andRollNo :(int)rollno andMArks :(double)marks andSubCode :(NSString *)subcode;

-(NSString *)description;
@end
