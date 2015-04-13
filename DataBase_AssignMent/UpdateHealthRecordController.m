//
//  UpdateHealthRecordController.m
//  DataBase_AssignMent
//
//  Created by Rajesh on 11/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "UpdateHealthRecordController.h"
#import "HealthRecord.h"
#import "DataBaseManager.h"

@interface UpdateHealthRecordController ()

@end

@implementation UpdateHealthRecordController
@synthesize textRecordValue,datePicker,typeSegment,lableDate;

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
    
    self.textRecordValue.delegate=self;
    DataBaseManager *databaseManager=[[DataBaseManager alloc]init];
    [databaseManager copyDBinDocFolder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSubmit:(id)sender {
    
    DataBaseManager *databaseManager=[[DataBaseManager alloc]init];
    
    double recordValue=[textRecordValue.text doubleValue];
    
    NSString *recordType=@"";
    
    if(typeSegment.selectedSegmentIndex==0)
    {
        recordType=@"sugar";
    }
    if(typeSegment.selectedSegmentIndex==1)
    {
        recordType=@"blood";
    }
    
    
    NSDate *d=datePicker.date;
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    [format setDateFormat:@"dd-MM-yyyy"];
    
    NSString *str=[format stringFromDate:d];
    lableDate.text=str;
    
    
    
    
    HealthRecord *rec=[[HealthRecord alloc]initWithRecordId:-1 andRecordType:recordType andRecordValue:recordValue andRecordDate:str];
    
   
    
    int result=[databaseManager insertHealthRecord:rec];
    NSLog(@"%d",result);
    
     NSLog(@"%@",[rec description]);
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return true;
}

@end
