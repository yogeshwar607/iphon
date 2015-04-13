//
//  FirstViewController.m
//  AlertViewDemo
//
//  Created by Rajesh on 06/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "FirstViewController.h"


@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize  textNum,lableResut;

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

- (IBAction)onProcess:(id)sender {
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"DATA PROCESSING" message:@"Select Operation" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"square",@"Cube",@"Factorial",nil];
    
    [alert show];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return true;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    int n=[textNum.text intValue];
    int result=1;
    
    switch(buttonIndex)
    {
        case 1: result=n*n;
            break;
            
        case 2: result=n*n*n;
            break;
        case 3:
            
            for(int i=1;i<=n;i++)
                result=result*i;
            break;
    }
    
    lableResut.text=[NSString stringWithFormat:@"%d",result];
}



@end
