//
//  ViewController.m
//  Assign_pfile_college
//
//  Created by Rajesh on 15/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"
#import "AddDetailViewController.h"

static NSString *pListPath;
@interface ViewController ()

@end

@implementation ViewController
@synthesize lableName,lableYear,segmentType,courseTable,dUserInfo,courseArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self copyPlistToDocFolder];
    
    
    NSData *data=[NSData dataWithContentsOfFile:pListPath];
    
    NSPropertyListFormat format;
    NSError *error;
    
    dUserInfo=[NSPropertyListSerialization propertyListWithData:data options:NSPropertyListMutableContainersAndLeaves format:&format error:&error];
   // NSLog(@"%@",dUserInfo);
    
    lableYear.text=[[dUserInfo objectForKey:@"eyear"]description];
    lableName.text=[dUserInfo objectForKey:@"iname"];
    
    NSNumber *type=[dUserInfo objectForKey:@"isprivate"];
    
    if(type==0)
    {
        segmentType.selectedSegmentIndex=0;
    }
    else
        segmentType.selectedSegmentIndex=1;
    
     NSLog(@"jjk");
    
   courseArray=[dUserInfo objectForKey:@"course"];
    courseTable.delegate=self;
    courseTable.dataSource=self;
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [courseArray count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    static NSString *CellIdentifier = @"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...

      NSLog(@"hii");
    
    NSString *courseName=[[courseArray objectAtIndex:indexPath.row]objectForKey:@"cname"];
    NSNumber *fees=[[courseArray objectAtIndex:indexPath.row]objectForKey:@"cfees"];
    NSNumber *duration=[[courseArray objectAtIndex:indexPath.row]objectForKey:@"cduration"];
    
        
    NSString *detail=[NSString stringWithFormat:@"%@ : %@ : %@",courseName,fees,duration];
    NSLog(@"%@",detail);
   cell.textLabel.text=detail;
    return cell;

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onUpdate:(id)sender {
}

-(void)copyPlistToDocFolder
{
    NSBundle *bundle=[NSBundle mainBundle];
    NSString *plistSourcePath=[bundle pathForResource:@"college" ofType:@"plist"];
    
    // creat path for plist in doc dir
    
    
    NSArray *array=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true);
    
    NSString *docDirPath=[array objectAtIndex:0];
    
    NSString *listPathInDocFolder=[docDirPath stringByAppendingPathComponent:@"college.plist"];
    
    
    // file manager
    
    NSFileManager *fileManager=[NSFileManager defaultManager];
    
    BOOL exit=[fileManager fileExistsAtPath:listPathInDocFolder isDirectory:false];
    
    if(!exit)
    {
        [fileManager copyItemAtPath:plistSourcePath toPath:listPathInDocFolder error:nil];
    }
    
    NSLog(@"%@path",listPathInDocFolder);
    pListPath=listPathInDocFolder;
    _strPath=pListPath;
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    AddDetailViewController *add= [segue destinationViewController];
    add.listPath=pListPath;
    
    
}
@end

