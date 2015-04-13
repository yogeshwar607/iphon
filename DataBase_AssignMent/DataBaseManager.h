//
//  DataBaseManager.h
//  DataBase_AssignMent
//
//  Created by Rajesh on 11/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HealthRecord.h"
#import <sqlite3.h>

static NSString *dbFilePath;
@interface DataBaseManager : NSObject

-(void)copyDBinDocFolder;
-(NSMutableArray *)getAllHealthRecord:(NSString*)recordType;
-(int)insertHealthRecord :(HealthRecord *)rec;

@end
