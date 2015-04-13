//
//  ViewController.m
//  UserDefaultDemo
//
//  Created by Rajesh on 12/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"
#import "SettingViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize textPassword;
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
-(void)viewDidAppear:(BOOL)animated
{
    textPassword.text=@"";
}
- (IBAction)onGo:(id)sender {

    if([textPassword.text isEqual:@""])
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"login" message:@"Please enter password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
    // get objects of user defaults
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *storedPass=[defaults objectForKey:@"password"];
    
        if(storedPass==nil)  //no password
        {
            //create password
            [defaults setObject:textPassword.text forKey:@"password"];
            [defaults synchronize]; //it stores data permanently
        }
        else   //match password
        {
            if([storedPass isEqual:textPassword.text])
            {
                //go to next controller
                SettingViewController *settingCon=[self.storyboard instantiateViewControllerWithIdentifier:@"settingcon"];
                [self presentViewController:settingCon animated:true completion:nil];
                
                
            }
            else{
                UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"login" message:@"Wrong password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                 [alert show];
            }
        }
    }
}
@end
