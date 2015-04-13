//
//  DataBaseManager.m
//  DataBase_AssignMent
//
//  Created by Rajesh on 11/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "DataBaseManager.h"
#import "HealthRecord.h"

@implementation DataBaseManager

-(void)copyDBinDocFolder
{
    NSBundle *bundle=[NSBundle mainBundle];
    
    NSString *strsourcePath=[bundle pathForResource:@"healthrecorddb" ofType:@"sqlite3"];
    
    //find document directory path
    
    
    NSArray *arrayPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true);
    
    NSString *docdirPath=[arrayPath objectAtIndex:0];
    
    dbFilePath=[docdirPath stringByAppendingPathComponent:@"healthrecorddb.sqlite3"];
    
    // copy  db from source  to doc
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    
    BOOL exits=[fileManager fileExistsAtPath:dbFilePath isDirectory:false];
    
    if(!exits)
    {
        [fileManager copyItemAtPath:strsourcePath toPath:dbFilePath error:nil];
    }
    NSLog(@"%@",docdirPath);
}//eof copy method



-(NSMutableArray *)getAllHealthRecord :(NSString*)recordType
{
    NSMutableArray *array=[[NSMutableArray alloc]init];
    
    NSString *query=[NSString stringWithFormat:@"select * from healthrecord where recordtype='%@'",recordType];
    //NSString *query=@"select * from healthrecord where recordtype='blood'";
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
                int recordid=sqlite3_column_int(statement, 0);
                const char* recordtype=sqlite3_column_text(statement, 1);
                double recordvalue=sqlite3_column_double(statement, 2);
                const char* recorddate=sqlite3_column_text(statement, 3);
                
                NSString *str=[NSString stringWithFormat:@"%d,%s,%lf,%s",recordid,recordtype,recordvalue,recorddate];
                
                HealthRecord *hr=[[HealthRecord alloc]initWithRecordId:recordid andRecordType:[NSString stringWithUTF8String:recordtype] andRecordValue:recordvalue andRecordDate:[NSString stringWithUTF8String:recorddate]];
                 NSLog(@"%@",[hr description]);
                [array addObject:hr];
                
                NSLog(@"%@",str);
                
            }// eof step
            
        } // eof statement
        
    } // eof database
    
    sqlite3_close(database);
   
    return array;
    
}// eof method

-(int)insertHealthRecord:(HealthRecord *)rec
{
    NSString *query=[NSString stringWithFormat:@"insert into healthrecord(recordtype,recordvalue,recorddate) values('%@',%lf,'%@');",rec.recordType,rec.recordValue,rec.recordDate];
    // open data base
    
    sqlite3 *database;
    int r1=sqlite3_open([dbFilePath UTF8String], &database);
    int result=-1;
    
    if(r1==SQLITE_OK)   // db is open
    {
        // execute non select query
        
        sqlite3_exec(database, [query UTF8String], NULL, NULL, NULL);
    }
    sqlite3_close(database);
    return result;

}



@end
