//
//  AddProductViewController.m
//  Assign_StoryBoard
//
//  Created by Rajesh on 10/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "AddProductViewController.h"
#import "Product.h"
#import "ProductViewController.h"

@interface AddProductViewController ()

@end

@implementation AddProductViewController
@synthesize textPrice,textProductname,textQty;
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
    
    self.textPrice.delegate=self;
    self.textProductname.delegate=self;
    self.textQty.delegate=self;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return true;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDone:(id)sender {
    
    NSString *strProductName=textProductname.text;
    int price=[textPrice.text intValue];
    int qty=[textQty.text intValue];
    
    NSLog(@"%@",strProductName);
    Product *p=[[Product alloc]initWithName:strProductName andPrice:price andQuantity:qty];
   
    
    NSArray *arrayCon=[self.navigationController viewControllers];
    
    ProductViewController *pCon=[arrayCon objectAtIndex:0];
    
    [pCon.mArrayProduct addObject:p];
  //  NSLog(@"%@",p);
    
    [self.navigationController popViewControllerAnimated:true];
    
    
    
}
@end
