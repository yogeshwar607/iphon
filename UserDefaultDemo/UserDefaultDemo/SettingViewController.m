//
//  SettingViewController.m
//  UserDefaultDemo
//
//  Created by Rajesh on 12/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController
@synthesize textNewPass,textOldPass;
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
-(void)viewDidAppear:(BOOL)animated
{
    textNewPass.text=@"";
    textOldPass.text=@"";
}

- (IBAction)onChangePassword:(id)sender {
    if([textOldPass.text isEqual:@"" ] || [textNewPass.text isEqual:@"" ])
    {
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"login" message:@"Please enter password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        // get objects of user defaults
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        NSString *storedPass=[defaults objectForKey:@"password"];
     
            if([storedPass isEqual:textOldPass.text])
            {
                //go to next controller
                [defaults setObject:textNewPass.text forKey:@"password"];
                [defaults synchronize]; //it stores data permanently

                
                
            }
            else{
                UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"login" message:@"Wrong password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
        
    }

}

- (IBAction)onBack:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
    
}
@end
