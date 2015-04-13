//
//  FirstViewController.m
//  ImageViewDemo
//
//  Created by Rajesh on 06/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize segment1,imageView1;
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

- (IBAction)imageSegment:(id)sender {
    
   
    
    switch (segment1.selectedSegmentIndex) {
      
        case 0:
        {
    UIImage *img=[UIImage imageNamed:@"Italy.png"];
            
            imageView1.image=img;
                  }
            break;
                  
        case 1:
        {
            UIImage *img=[UIImage imageNamed:@"India.png"];
            
            imageView1.image=img;
        }
            
            break;
        case 2:
        {
            UIImage *img=[UIImage imageNamed:@"Russia.png"];
            
            imageView1.image=img;
        }
            
            break;
        default:
            break;
    }
    
    
}
@end
