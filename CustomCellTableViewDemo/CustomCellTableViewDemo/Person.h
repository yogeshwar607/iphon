//
//  Person.h
//  CustomCellTableViewDemo
//
//  Created by Rajesh on 08/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property NSString *name,*gender;
@property int age;

-(id)initWithName:(NSString *)name andAge:(int)age andGender:(NSString*)gender;
@end
