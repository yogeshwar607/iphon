//
//  LoginViewController.m
//  Assign_CoreData_Order
//
//  Created by Rajesh on 12/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "LoginViewController.h"
#import "TakeOrderViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize textEmpId,empId;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onGo:(id)sender {
    
    empId=textEmpId.text;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    TakeOrderViewController *takeCon=[segue destinationViewController];
    takeCon.empId=empId;
    
    
}
-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if([textEmpId.text isEqual:@""] )
    {
        return false;
    }
    return true;
}

@end
