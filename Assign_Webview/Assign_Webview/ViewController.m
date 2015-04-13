//
//  ViewController.m
//  Assign_Webview
//
//  Created by Rajesh on 18/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSString *hPlace;
}
@end
static NSString *pListPath;

@implementation ViewController
@synthesize pickerview,place,dPlaceInfo,webView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self copyPlistToDocFolder];
    
    // read data from plist
    
    NSData *plistData=[NSData dataWithContentsOfFile:pListPath];
    
    NSPropertyListFormat format;
    NSError *error;
    
    
    dPlaceInfo=[NSPropertyListSerialization propertyListWithData:plistData options:NSPropertyListMutableContainersAndLeaves format:&format error:&error];
    
    NSLog(@"%@",dPlaceInfo);
    
    
    //  show data in ui
    
   
    place=[[NSMutableArray alloc]initWithArray:[dPlaceInfo allKeys] copyItems:true];

 //   [place addObject:[dPlaceInfo objectForKey:@"berlin"]];
    
    NSLog(@"%@",[place objectAtIndex:0]);
    NSLog(@"%@",[place objectAtIndex:1]);
    NSLog(@"%@",[place objectAtIndex:2]);
    
    pickerview.delegate=self;
    pickerview.dataSource=self;


}//eof viewDidLoad
//to decide no of components

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;  //only one component/column
}

//to decide no of rows
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
  
    return [place count]; //no of rows
 
    
    
}

//to decide data for each row
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
   
    NSString *str=[place objectAtIndex:row];
    
    return str;
    
}


//get data from currently selected row

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
      hPlace=[place objectAtIndex:row];
    
   // hPlace=[str stringByAppendingString:@".html"];
   
    NSLog(@"%@",hPlace);
   
    [pickerView reloadAllComponents];
    [self loadPlace];

}


-(void)loadPlace
{
    NSString *filePath=[[NSBundle mainBundle] pathForResource:hPlace ofType:@"html"];
    
    //load contents of file in a string
    NSError *err;
    
    NSString *strHtmlData=[NSString stringWithContentsOfFile:filePath encoding:NSStringEncodingConversionAllowLossy error:&err];
    
    [webView loadHTMLString:strHtmlData baseURL:nil];
}



-(void)copyPlistToDocFolder
{
    NSBundle *bundle=[NSBundle mainBundle];
    NSString *plistSourcePath=[bundle pathForResource:@"placeinfo" ofType:@"plist"];
    
    // create path for plist in doc folder'''
    
    NSArray *pathArray=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true);
    
    NSString *docDirPath=[pathArray objectAtIndex:0];
    
    NSString *plistPathInDocFolder= [docDirPath stringByAppendingPathComponent:@"placeinfo.plist"];
    
    
    // chexk if file exits
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    BOOL exist=[fileManager fileExistsAtPath:plistPathInDocFolder isDirectory:false];
    
    if(!exist)
    {
        [fileManager copyItemAtPath:plistSourcePath toPath:plistPathInDocFolder error:nil];
        
    }
    
    NSLog(@"path at file%@",plistPathInDocFolder);
    pListPath=plistPathInDocFolder;
    
}
@end
