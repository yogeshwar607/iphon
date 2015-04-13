//
//  FirstViewController.m
//  AddApp
//
//  Created by Rajesh on 06/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize textNum1,textNum2,lableResult;

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

- (IBAction)buttonAdd:(id)sender {
    
    int a=[textNum1.text intValue];
    int b=[textNum2.text intValue];
    
    int c=a+b;
    
    NSString *sum=[NSString stringWithFormat:@"%d",c];
    NSLog(@"Sum is:%@",sum);
    lableResult.text=sum;
    
    
}
- (IBAction)buttonMul:(id)sender {

    int a=[textNum1.text intValue];
    int b=[textNum2.text intValue];
    
    int c=(a*b);
    
    NSString *mul=[NSString stringWithFormat:@"%d",c];
    NSLog(@"Sum is:%@",mul);
    
    lableResult.text=mul;

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return true;
}

@end
