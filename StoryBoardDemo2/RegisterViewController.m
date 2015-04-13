//
//  RegisterViewController.m
//  StoryBoardDemo2
//
//  Created by Rajesh on 10/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "RegisterViewController.h"
#import "ViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController
@synthesize textUsername;
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

- (IBAction)onDone:(id)sender {
    
    NSString *strData=textUsername.text;
    
    // get all controllers in stack
    NSArray *arrayCon=[self.navigationController viewControllers];
    
    // get login controller from 0 position
    
    ViewController *loginCon=[arrayCon objectAtIndex:0];
    
    loginCon.textPassword.text=strData;
    
    // remove current / register controller from stack
    
    [self.navigationController popViewControllerAnimated:true];
}
@end
