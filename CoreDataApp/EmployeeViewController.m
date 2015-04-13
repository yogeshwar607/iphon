//
//  EmployeeViewController.m
//  CoreDataApp
//
//  Created by Rajesh on 12/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "EmployeeViewController.h"

@interface EmployeeViewController ()

@end

@implementation EmployeeViewController
@synthesize textId,textName,textSalary,object;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if(object !=nil)
    {
    
    textName.text=[object valueForKey:@"empName"];
    textSalary.text=[[object valueForKey:@"empSalary"]description];
        textId.text=[[object valueForKey:@"empId"]description];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDone:(id)sender {
    
    
    // get object of managed contex;;;;
    
    UIApplication *app=[UIApplication sharedApplication];
    id appDelegate=[app delegate];
    
    NSManagedObjectContext *managedContex=[appDelegate managedObjectContext];
    
    NSNumber *empId=[NSNumber numberWithInt:[textId.text intValue]];
                    
    NSString *empName=textName.text;
    
     NSNumber *empSalary=[NSNumber numberWithFloat:[textSalary.text floatValue]];
    
    
    // create object to be stored in dataStore  if it insert operation
    
    if(object ==nil)
    {
   object=[NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:managedContex];
    
    }
    
    // set attribute values in object ;;;  ;;
    
    [object setValue:empId forKey:@"empId"];
    [object setValue:empName forKey:@"empName"];
    [object setValue:empSalary forKey:@"empSalary"];
    
    // save current context to persistent storage
    
    
    NSError *err=nil;
    BOOL isSaved=[managedContex save:&err];
    if (!isSaved) {
        NSLog(@"error:%@",err);
        
    }
    else
        NSLog(@"saveddd  ...");
    
    
    // hide current controller
    
    [self.navigationController popViewControllerAnimated:true];
    
}
@end
