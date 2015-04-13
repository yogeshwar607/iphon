//
//  UpdateStudentController.m
//  SqlLiteDemo1
//
//  Created by Rajesh on 11/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "UpdateStudentController.h"
#import "DataBaseManager.h"

@interface UpdateStudentController ()

@end

@implementation UpdateStudentController
@synthesize student,textMarks,textName,textRoll,textSubject;
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
    textName.text=student.name;
    textMarks.text=[NSString stringWithFormat:@"%f",student.marks];
    textRoll.text=[NSString stringWithFormat:@"%d",student.rollno];
    textSubject.text=student.subcode;
    
}



- (IBAction)onDelete:(id)sender {
    
    DataBaseManager *databaseManager=[[DataBaseManager alloc]init];
    int result=[databaseManager deleteStudent:student.rollno];
    
    NSLog(@"%d",result);
    [self.navigationController popViewControllerAnimated:true];
    
}

- (IBAction)onSave:(id)sender {
    
    
    DataBaseManager *databaseManager=[[DataBaseManager alloc]init];
    
    Student *stu=[[Student alloc]initWithName:textName.text andRollNo:[textRoll.text intValue] andMArks:[textMarks.text doubleValue] andSubCode:textSubject.text];
    
    int result=[databaseManager updateStudent:stu];
    NSLog(@"%d",result);
    [self.navigationController popViewControllerAnimated:true];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
