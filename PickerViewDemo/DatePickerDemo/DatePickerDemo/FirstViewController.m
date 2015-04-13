//
//  FirstViewController.m
//  DatePickerDemo
//
//  Created by Rajesh on 06/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize datePicker,textName,labelDate,dateView;
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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)datePicker:(id)sender {
}

- (IBAction)onOK:(id)sender {
     [dateView setHidden:TRUE];
    
    NSDate *d=datePicker.date;
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    [format setDateFormat:@"dd-MM-yyyy"];
    
    NSString *str=[format stringFromDate:d];
    labelDate.text=str;
    
    NSLog(@"%@",str);
}

- (IBAction)hidekb:(id)sender {
    
    [sender resignFirstResponder];
    
}
- (IBAction)onSaveButton:(id)sender {
    
    NSString *strName=textName.text;
    NSString *strDate=labelDate.text;
    NSString *strData= [NSString stringWithFormat:@"%@ %@",strName,strDate];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"mydata" message:strData delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
    [alert show];
}

- (IBAction)onSelect:(id)sender {
    
    [dateView setHidden:FALSE];
}
@end
