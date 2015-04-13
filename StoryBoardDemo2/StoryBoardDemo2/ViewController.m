//
//  ViewController.m
//  StoryBoardDemo2
//
//  Created by Rajesh on 10/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"
#import "HomeViewController.h"

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

- (IBAction)onGo:(id)sender {
    
    
    if ([textPassword.text isEqualToString:@"abc123"]) {
        
    HomeViewController *homeCon=[self.storyboard instantiateViewControllerWithIdentifier:@"homeCon"];
    [self.navigationController pushViewController:homeCon animated:true];   
}
}
@end
