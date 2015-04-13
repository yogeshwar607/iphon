//
//  AddDetailsViewController.m
//  Assign_MultiScreen_TableView
//
//  Created by Rajesh on 09/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "AddDetailsViewController.h"


@interface AddDetailsViewController ()

@end

@implementation AddDetailsViewController
@synthesize textFname,textLname,dataCon;
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

- (IBAction)onAdd:(id)sender {
    
      NSString *strData=[NSString stringWithFormat:@"%@ %@",textFname.text,textLname.text];
    
    [dataCon.mArrayName addObject:strData];
    
    [self dismissViewControllerAnimated:true completion:nil];
}
@end
