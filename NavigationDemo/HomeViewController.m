//
//  HomeViewController.m
//  NavigationDemo
//
//  Created by Rajesh on 10/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "HomeViewController.h"
#import "SettingViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

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

- (IBAction)onSetting:(id)sender {
    
 SettingViewController *setCon=[[SettingViewController alloc]initWithNibName:@"SettingViewController" bundle:nil];
    [self.navigationController pushViewController:setCon animated:true];
    

    
}
@end
