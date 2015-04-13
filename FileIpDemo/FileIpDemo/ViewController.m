//
//  ViewController.m
//  FileIpDemo
//
//  Created by Rajesh on 10/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize textDesc,textTittle,tableView,arrayFiles;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    arrayFiles=[[NSMutableArray alloc]init];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    // find path upto document dir of our app
    
    
    NSArray *arrayPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true);
    
     docDirPath=[arrayPath objectAtIndex:0];
    NSLog(@"documents:%@",docDirPath);
    [self loadFileList];
}

//
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [arrayFiles count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell *cell=[[UITableViewCell alloc]init];
    cell.textLabel.text=[arrayFiles objectAtIndex:indexPath.row];
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *fileName=[arrayFiles objectAtIndex:indexPath.row];
    NSString *filePath=[docDirPath stringByAppendingPathComponent:fileName];
    //read data from file using file manager
    
    textDesc.text=[NSString stringWithContentsOfFile:filePath encoding:NSStringEncodingConversionAllowLossy error:nil];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSave:(id)sender {
    
    NSString *strTitle=textTittle.text;
    NSString *fileName=[strTitle stringByAppendingString:@".txt"];
    
   
    
    // creaTE file in doc directory
    
    NSString *filePath=[docDirPath stringByAppendingPathComponent:fileName];
    
    NSLog(@"file path%@",filePath);
    
    // create file if not exist
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    BOOL exit=[fileManager fileExistsAtPath:filePath isDirectory:FALSE];
    
    
    if(!exit)
    {
        [fileManager createFileAtPath:filePath contents:nil attributes:nil];
    }
    
    
    // write data into the file
    // open file for writing data
    
    NSFileHandle *fileHandle=[NSFileHandle fileHandleForWritingAtPath:filePath];
    
    // convert data sequence of bytes
    
    
    NSData *data=[NSData dataWithBytes:[textDesc.text UTF8String] length:[textDesc.text length]];
                  
                  // write data in file
                  
                  [fileHandle seekToEndOfFile];
                  [fileHandle writeData:data];
                  [fileHandle closeFile];
    [self loadFileList];
    
}//eof save action



-(void)loadFileList{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSError *err=nil;
    NSArray *array=[fileManager contentsOfDirectoryAtPath:docDirPath error:&err];
        
        arrayFiles=[NSMutableArray arrayWithArray:array];
        [self.tableView reloadData];
        
        
}

@end
