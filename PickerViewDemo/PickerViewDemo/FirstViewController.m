//
//  FirstViewController.m
//  PickerViewDemo
//
//  Created by Rajesh on 08/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
//BOOL firstTime;
@end

@implementation FirstViewController
@synthesize tableCourse,labelStudent,pickerViewCourse,mArrayCourses,mArrayStudent,mArrayDAC,mArrayVLSI,mArrayWIMC,mArrayDESD,mArrayDSSD;
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
    mArrayCourses=[[NSMutableArray alloc]initWithObjects:@"WIMC",@"DAC",@"DESD",@"VLSI",@"DSSD", nil] ;
    mArrayWIMC=[[NSMutableArray alloc] initWithObjects:@"WIMC1",@"WIMC2",@"WIMC3",@"WIMC4",@"WIMC5", nil];
    mArrayVLSI=[[NSMutableArray alloc] initWithObjects:@"Bhaskar",@"Rohit",@"Yogi",@"Akhil",@"Deepak", nil];
    mArrayDESD=[[NSMutableArray alloc] initWithObjects:@"DESD1",@"DESD2",@"DESD3",@"DESD4", nil];
    mArrayDSSD=[[NSMutableArray alloc] initWithObjects:@"DSSD1",@"DSSD2",@"DSSD3", nil];
    mArrayDAC=[[NSMutableArray alloc] initWithObjects:@"DAC1",@"DAC2",@"DAC3",@"DAC4",@"DAC5", nil];
    mArrayStudent=mArrayWIMC;
    //set protocols
    self.pickerViewCourse.delegate=self;
    self.pickerViewCourse.dataSource=self;
    
}//eof viewDidLoad
//to decide no of components
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;  //only one component/column
}
//to decide no of rows
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(component==0){
    return [mArrayCourses count]; //no of rows
    }
    
    if(component==1){
        return [mArrayStudent count]; //no of rows
        
    }
}
//to decide data for each row
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    if(component==0){
        NSString *str=[mArrayCourses objectAtIndex:row];
        return str;
    }
    
    if(component==1){
        NSString *str=[mArrayStudent objectAtIndex:row];
       
        return str;
    }
    return @"";
   
}
//get data from currently selected row
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if(component==0){
        NSString *str=[mArrayCourses objectAtIndex:row];
        switch (row) {
            case 0:
                mArrayStudent=mArrayWIMC;

                break;
            case 1:
                mArrayStudent=mArrayDAC;
                break;
            case 2:
                mArrayStudent=mArrayDESD;
                break;
            case 3:
                mArrayStudent=mArrayVLSI;
                break;
            case 4:
                mArrayStudent=mArrayDSSD;
                break;
                
            default:
                break;
        }
        tableCourse.text=str;    }
    [pickerView reloadAllComponents];
    
    if(component==1){
        NSString *str=[mArrayStudent objectAtIndex:row];
        
        tableCourse.text=str;
    }

   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
