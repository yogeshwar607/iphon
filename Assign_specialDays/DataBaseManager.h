//
//  DataBaseManager.h
//  Assign_specialDays
//
//  Created by Rajesh on 15/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "SpecialDay.h"
static NSString *dbFilePath;
@interface DataBaseManager : NSObject

-(void)copyDBinDocFolder;
-(NSMutableArray *)getAllSpecialDays;

-(int)insertSpecialDays:(SpecialDay *)sd;
@end