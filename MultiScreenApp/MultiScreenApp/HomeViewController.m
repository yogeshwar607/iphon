//
//  HomeViewController.m
//  MultiScreenApp
//
//  Created by Rajesh on 09/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "HomeViewController.h"
#import "NextViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize textNum,lableResult;

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

-(void)viewDidAppear:(BOOL)animated
{
    textNum.text=@"";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSend:(id)sender {
    
    int n=[textNum.text intValue];
    
    NextViewController *nextCon=[[NextViewController alloc]initWithNibName:@"NextViewController" bundle:nil];
    nextCon.number=n;
    nextCon.homeCon=self;
    
    [self presentViewController:nextCon animated:true completion:nil];
    [self dismissViewControllerAnimated:true completion:nil];
    
}
@end
