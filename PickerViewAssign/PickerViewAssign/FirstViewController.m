//
//  FirstViewController.m
//  PickerViewAssign
//
//  Created by Rajesh on 08/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize textName,textCity,segmentEducation,mArrayCity,pickerViewCity,myView;
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
    mArrayCity=[[NSMutableArray alloc] initWithObjects:@"Pune",@"Mumbai",@"Chennai",@"Delhi",@"Kolkata", nil];
    //set protocols
    self.pickerViewCity.delegate=self;
    self.pickerViewCity.dataSource=self;
}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [mArrayCity count];
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [mArrayCity objectAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSString *str=[mArrayCity objectAtIndex:row];
    textCity.text=str;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSelect:(id)sender {
    [myView setHidden:false];
}
- (IBAction)onOK:(id)sender {
    [myView setHidden:true];
}

- (IBAction)onSave:(id)sender {
    NSString *name=textName.text;
    NSString *city=textCity.text;
    
    NSString *education=@"";
    
    switch (segmentEducation.selectedSegmentIndex) {
        case 0:
            education=@"UG";
            break;
            
        case 1:
            education=@"PG";
            break;
        case 2:
            education=@"PhD";
            break;
        default:
            break;
    }
    NSString *strData=[NSString stringWithFormat:@"%@ %@ %@",name,city,education];
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"MyData" message: strData delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];

}
-(IBAction)hideKeyBoard:(id)sender {
    [textName resignFirstResponder];
}
@end
