//
//  SpecialDay.h
//  Assign_specialDays
//
//  Created by Rajesh on 15/12/14.
//  Copyright (c) 2014 :. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpecialDay : NSObject

@property NSString *name,*email,*contactNo,*dayType,*date,*imageName;
-(id)initWithName :(NSString*)name andEmail :(NSString*)email andContactNo :(NSString*)contactNo andDayType : (NSString*)dayType andDate :(NSString*)date andImageName :(NSString*)imageName;
@end
