//
//  FirstViewController.m
//  SegmentdCntrlNUiSwitchDemo
//
//  Created by Rajesh on 06/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize textName,lableStatus,segmentedGender,switchStatus;

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

- (IBAction)onSave:(id)sender {
    
    NSString *name=textName.text;
    
    
    NSString *gender=@"";
    
    switch (segmentedGender.selectedSegmentIndex) {
        case 0:
            gender=@"Male";
            break;
            
        case 1:
            gender=@"Female";
            break;
        default:
            break;
    }
    
   // NSString *strStatus=lableStatus.text;
    
    NSString *strData=[NSString stringWithFormat:@"%@%@%@",name,gender,lableStatus.text];
    
    NSLog(@"%@",strData);
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"My DAta" message:strData delegate:nil cancelButtonTitle:@"Thanks" otherButtonTitles:@"ok",@"Cancel", nil];
    
    [alert show];
}



- (IBAction)statusgender:(id)sender {
    
    
}

-(IBAction)switchChanged:(id)sender{
    
    if([switchStatus isOn])
    {
        lableStatus.text=@"married";
    }
    else
     lableStatus.text=@"Unmarried";
}

@end
