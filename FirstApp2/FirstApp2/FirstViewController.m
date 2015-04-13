//
//  FirstViewController.m
//  FirstApp2
//
//  Created by Rajesh on 06/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize textName,lableHello,buttonHello;

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
    NSLog(@"screen loaded");
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)OnSayHello:(id)sender
{
    NSLog(@"HElloo i am here to assit You");
    
    NSString *strName=textName.text;
    
    NSString *msg=[NSString stringWithFormat:@"Helloo%@",strName];
    
    lableHello.text=msg;
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return true;
}
@end
