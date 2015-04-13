//
//  SettingViewController.m
//  NavigationDemo
//
//  Created by Rajesh on 10/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

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
    
    UIBarButtonItem *rightButton=[[UIBarButtonItem alloc]initWithTitle:@"Logout" style:UIBarButtonItemStyleDone target:self action:@selector(doLogout)];
    
    self.navigationItem.rightBarButtonItem=rightButton;
}

-(void)doLogout
{
    [self.navigationController popToRootViewControllerAnimated:true];
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
