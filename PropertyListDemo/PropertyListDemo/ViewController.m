//
//  ViewController.m
//  PropertyListDemo
//
//  Created by Rajesh on 15/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"
static NSString *pListPath;
@interface ViewController ()

@end

@implementation ViewController
@synthesize textAge,lablefullName,lablePhonenumber,segmentStatus,dUserInfo;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self copyPlistToDocFolder];
    
    // read data from plist
    
    NSData *plistData=[NSData dataWithContentsOfFile:pListPath];
    
    NSPropertyListFormat format;
    NSError *error;
    
    
    dUserInfo=[NSPropertyListSerialization propertyListWithData:plistData options:NSPropertyListMutableContainersAndLeaves format:&format error:&error];
    
    NSLog(@"%@",dUserInfo);
    
    
    //  show data in ui
    
    NSString *fname=[dUserInfo objectForKey:@"firstname"];
    NSString *lname=[dUserInfo objectForKey:@"lastname"];
    
    lablefullName.text=[NSString stringWithFormat:@"%@ %@",fname,lname];
    
    NSArray *phoneArray=[dUserInfo objectForKey:@"phone"];
    NSString *allPhone=@"";
    
    for (NSString *str in phoneArray)
    {
        allPhone=[allPhone stringByAppendingString:str];
        allPhone=[allPhone stringByAppendingString:@","];
    }
    lablePhonenumber.text=allPhone;
    
    
    NSNumber *numAge=[dUserInfo objectForKey:@"age"];
    textAge.text=[numAge description];
    
    
    NSNumber *isMarried=[dUserInfo objectForKey:@"ismarried"];
    
    NSLog(@"%@",isMarried);
    
    if ([isMarried intValue]==0) {
        segmentStatus.selectedSegmentIndex=1;
    }
    else
        segmentStatus.selectedSegmentIndex=0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onUpdate:(id)sender {
    
    
    int age=[textAge.text intValue];
    
    int isMarried=segmentStatus.selectedSegmentIndex==0?1:0;
    
    NSNumber *numIsMarried=[NSNumber numberWithInt:isMarried];
    NSNumber *numAge=[NSNumber numberWithInt:age
                      ];
    
    // store data in dictionary
    
    
    [dUserInfo setObject:numIsMarried forKey:@"ismarried"];
    [dUserInfo setObject:numAge forKey:@"age"];
    
    // write dictionary back to plist
    
    
    [dUserInfo writeToFile:pListPath atomically:YES];
    
    
    
    
}

-(void)copyPlistToDocFolder
{
    NSBundle *bundle=[NSBundle mainBundle];
    NSString *plistSourcePath=[bundle pathForResource:@"userinfo" ofType:@"plist"];
    
    // create path for plist in doc folder'''
    
    NSArray *pathArray=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true);
    
    NSString *docDirPath=[pathArray objectAtIndex:0];
    
    NSString *plistPathInDocFolder= [docDirPath stringByAppendingPathComponent:@"userinfo.plist"];
    
    
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
