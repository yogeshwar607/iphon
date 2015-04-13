//
//  NextViewController.m
//  MultiScreenApp
//
//  Created by Rajesh on 09/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "NextViewController.h"


@interface NextViewController ()

@end

@implementation NextViewController

@synthesize lableResult,lableNum,number,homeCon;
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
    
    lableNum.text=[NSString stringWithFormat:@"%d",number];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onFact:(id)sender {
    int fact=1;
    for(int i=number;i>1;i--)
    {
        fact=fact*i;
    }
    
    lableResult.text=[NSString stringWithFormat:@"%d",fact];
   homeCon.lableResult.text=[NSString stringWithFormat:@"%d",fact];
}
- (IBAction)onBack:(id)sender {
    
    [self dismissViewControllerAnimated:true completion:nil];
}
@end
