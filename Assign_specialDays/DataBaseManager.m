//
//  DataBaseManager.m
//  Assign_specialDays
//
//  Created by Rajesh on 15/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "DataBaseManager.h"
#import "SpecialDay.h"

@implementation DataBaseManager

-(void)copyDBinDocFolder
{
    NSBundle *bundle=[NSBundle mainBundle];
    
    NSString *strsourcePath=[bundle pathForResource:@"specialdaysdb" ofType:@"sqlite3"];
    
    //find document directory path
    
    
    NSArray *arrayPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true);
    
    NSString *docdirPath=[arrayPath objectAtIndex:0];
    
    dbFilePath=[docdirPath stringByAppendingPathComponent:@"specialdaysdb.sqlite3"];
    
    // copy  db from source  to doc
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    
    BOOL exits=[fileManager fileExistsAtPath:dbFilePath isDirectory:false];
    
    if(!exits)
    {
        [fileManager copyItemAtPath:strsourcePath toPath:dbFilePath error:nil];
        NSLog(@"copied");
    }
    NSLog(@"%@",docdirPath);
}//eof copy method

-(NSMutableArray *)getAllSpecialDays
{
    NSMutableArray *array=[[NSMutableArray alloc]init];
    
    
    NSString *query=@"select * from specialdays";
    
    sqlite3 *database;   // pointer to database
    
    // open database
    
    int r1=sqlite3_open([dbFilePath UTF8String], &database);
    
    if(r1==SQLITE_OK)
    {
        NSLog(@"db is opened");
        
        // execute select query
        
        sqlite3_stmt *statement;   // to hold result set
        
        int r2=sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, NULL);
        
        if(r2==SQLITE_OK)  // no error in query
        {
            // read one row at a time from statement
            
            
            
            
            
            while(sqlite3_step(statement)==SQLITE_ROW)  // we are at new row
            {
                
                
                
                
                const char* name=sqlite3_column_text(statement, 0);
                const char* email=sqlite3_column_text(statement, 1);
                const char* contactNo=sqlite3_column_text(statement, 2);
                const char* dayType=sqlite3_column_text(statement, 3);
                const char* date=sqlite3_column_text(statement,4);
                const char* imageName=sqlite3_column_text(statement, 5);
                
                
                
                NSLog(@"data:%@",[NSString stringWithUTF8String:name]);
                
                SpecialDay *sd=[[SpecialDay alloc]initWithName:[NSString stringWithUTF8String:name] andEmail:[NSString stringWithUTF8String:email] andContactNo:[NSString stringWithUTF8String:contactNo] andDayType:[NSString stringWithUTF8String:dayType] andDate:[NSString stringWithUTF8String:date] andImageName:[NSString stringWithUTF8String:imageName]];
                
                
                [array addObject:sd];
               
                
            }
            
        }
        
    }
    
    sqlite3_close(database);
    return array;
    
}// eof method



-(int)insertSpecialDays:(SpecialDay *)sd
{
   
    NSLog(@"%@",sd.name);
   
    
    NSString *query=[NSString stringWithFormat:@"insert into specialdays values('%@','%@','%@','%@','%@','%@')",sd.name,sd.email,sd.contactNo,sd.dayType,sd.date,sd.imageName ];
    
    
    
    // open data base
    // in insert into special days
    
    NSLog(@"%@",query);
  
    
    
    sqlite3 *database;
    int r1=sqlite3_open([dbFilePath UTF8String], &database);
    int result=-1;
    
    if(r1==SQLITE_OK)       {
        
        result=sqlite3_exec(database, [query UTF8String], NULL, NULL, NULL);
      
        NSLog(@"hello");
    }
    sqlite3_close(database);
    return result;
}
@end
