//
//  DataBaseManager.m
//  SqlLiteDemo1
//
//  Created by Rajesh on 11/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "DataBaseManager.h"
#import "Student.h"


@implementation DataBaseManager

-(void)copyDBinDocFolder
{
    NSBundle *bundle=[NSBundle mainBundle];
    
    NSString *strsourcePath=[bundle pathForResource:@"studentdb" ofType:@"sqlite3"];
    
    //find document directory path
    
    
    NSArray *arrayPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true);
    
    NSString *docdirPath=[arrayPath objectAtIndex:0];
    
    dbFilePath=[docdirPath stringByAppendingPathComponent:@"studentdb.sqlite3"];
    
    // copy  db from source  to doc
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    
    BOOL exits=[fileManager fileExistsAtPath:dbFilePath isDirectory:false];
    
    if(!exits)
    {
        [fileManager copyItemAtPath:strsourcePath toPath:dbFilePath error:nil];
    }
    NSLog(@"%@",docdirPath);
}//eof copy method

-(NSMutableArray *)getAllStudent
{
    NSMutableArray *array=[[NSMutableArray alloc]init];
    
    
    NSString *query=@"select * from student";
    
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
                int rollno=sqlite3_column_int(statement, 0);
                const char* name=sqlite3_column_text(statement, 1);
                double marks=sqlite3_column_double(statement, 2);
                const char* subCode=sqlite3_column_text(statement, 3);
                
                NSString *str=[NSString stringWithFormat:@"%d,%s,%lf,%s",rollno,name,marks,subCode];
                                
                Student *s =[[Student alloc]initWithName:[NSString stringWithUTF8String:name] andRollNo:rollno andMArks:marks andSubCode:[NSString stringWithUTF8String:subCode]];
                
                [array addObject:s];
                
                NSLog(@"%@",str);

            }// eof step
            
        } // eof statement
        
    } // eof database
    
    sqlite3_close(database);
    return array;
    
}// eof method

-(int)insertStudent:(Student *)stu
{
    NSString *query=[NSString stringWithFormat:@"insert into student(name,marks,sub_code) values('%@',%lf,'%@');",stu.name,stu.marks,stu.subcode ];
    
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
} // eof of insertStudent method


-(int)deleteStudent:(int)roll
{
    NSString *query=[NSString stringWithFormat:@"delete from student where rollno=%d;",roll];
    
    // open database
    
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

-(int)updateStudent:(Student *)stu
{
    NSString *query=[NSString stringWithFormat:@"update student set name='%@', marks=%lf, sub_code='%@' where rollno=%d",stu.name,stu.marks,stu.subcode,stu.rollno];
    
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
