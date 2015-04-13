//
//  ViewController.m
//  SqlLiteDemo1
//
//  Created by Rajesh on 11/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//
#import "DataBaseManager.h"
#import "Student.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize textMarks,textName,textSubCode;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDone:(id)sender {
    
    double marks=[textMarks.text doubleValue];
    NSString *name=textName.text;
    NSString *subCode=textSubCode.text;
    
    Student *stu=[[Student alloc]initWithName:name andRollNo:-1 andMArks:marks andSubCode:subCode];
    
    DataBaseManager *dbManager=[[DataBaseManager alloc]init];
    
    int result=[dbManager insertStudent:stu];
    
    NSLog(@"%d",result);
    
    [self.navigationController popViewControllerAnimated:true];
}
@end
