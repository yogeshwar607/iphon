//
//  DataBaseManager.h
//  SqlLiteDemo1
//
//  Created by Rajesh on 11/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Student.h"

static NSString *dbFilePath;
@interface DataBaseManager : NSObject

-(void)copyDBinDocFolder;
-(NSMutableArray *)getAllStudent;
-(int)insertStudent :(Student *)stu;
-(int)deleteStudent :(int)roll;
-(int)updateStudent :(Student *)stu;
@end
