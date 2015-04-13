//
//  LoginViewController.m
//  NavigationDemo
//
//  Created by Rajesh on 10/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistrationViewController.h"
#import "HomeViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize textPassword,textUsername;

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
    
    self.navigationItem.title=@"Login";
    
    // add bar button on right of navigation bar
    
    UIBarButtonItem *rightButton=[[UIBarButtonItem alloc]initWithTitle:@"Register" style:UIBarButtonItemStyleDone target:self action:@selector(doRegister)];
    
    self.navigationItem.rightBarButtonItem=rightButton;
 
    textUsername.delegate=self;
    textPassword.delegate=self;
}
    

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)doRegister
{
    NSLog(@"Register");
    RegistrationViewController *regCon=[[RegistrationViewController alloc]initWithNibName:@"RegistrationViewController" bundle:nil];
    [self.navigationController pushViewController:regCon animated:true];
    
    
    
}

- (IBAction)onGo:(id)sender {
    
    if([textUsername.text isEqualToString:@"abc"] && [textPassword.text isEqualToString:@"123"])
    {
        HomeViewController *homeCon=[[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
        
       [ self.navigationController pushViewController:homeCon animated:true];
    }
    else{
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Login" message:@"Invalid credentials" delegate:self cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
    }
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return true;
}


@end
