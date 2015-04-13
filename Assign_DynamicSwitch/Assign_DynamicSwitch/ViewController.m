//
//  ViewController.m
//  Assign_DynamicSwitch
//
//  Created by Rajesh on 17/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize lLable,myView,myImageView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    CGRect rect=CGRectMake(20, 20, 150, 50);
    
    myView=[[UIView alloc]initWithFrame:rect];
    
    [myView setBackgroundColor:[UIColor blueColor]];
    
    
    lLable=[[UILabel alloc]initWithFrame:CGRectMake(5, 5, 70, 40)];
    [lLable setBackgroundColor:[UIColor yellowColor]];
    [lLable setText:@"left"];
    [lLable setTextColor:[UIColor blackColor]];
    
    [myView addSubview:lLable];
    
    [self.view addSubview:myView];
    
    
    UISwipeGestureRecognizer *swipeGesture=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(onSwipe:)];
    
    // add swipe properties
    
    swipeGesture.numberOfTouchesRequired=1;
    swipeGesture.direction=UISwipeGestureRecognizerDirectionRight;
    
    // add gesture to imageView
    
    [lLable addGestureRecognizer:swipeGesture];
    lLable.userInteractionEnabled=true;
    
    
    
    myImageView=[[UIImageView alloc]initWithFrame:CGRectMake(20, 100, 150, 150)];
    
    UIImage *img=[UIImage imageNamed:@"straw.jpg"];
    
    [myImageView setImage:img];
    
    [self.view addSubview: myImageView];
    
}


-(void)onSwipe:(UISwipeGestureRecognizer *)gesture
{
    
    
    int d=gesture.direction;
    NSLog(@"direction is %d",d);
    
    if(gesture.state==UIGestureRecognizerStatePossible)
    {
        NSLog(@"possible");
    }
    
    if(gesture.state==UIGestureRecognizerStateRecognized)
    {
        NSLog(@"recognized");
      
        int d=gesture.direction;
        
        if(d==UISwipeGestureRecognizerDirectionRight)
        {
                     //  [lLable removeFromSuperview];
            
           [self.lLable setFrame:CGRectMake(75,5, 70, 40)];
            
            [lLable setText:@"right"];
           
            gesture.direction=UISwipeGestureRecognizerDirectionLeft;
            
            [self rotate];
            
            
        }
        
        if(d==UISwipeGestureRecognizerDirectionLeft)
        {
            
           // [lLable removeFromSuperview];
            
          [self.lLable setFrame:CGRectMake(5,5, 70, 40)];
            [lLable setText:@"left"];
            
             gesture.direction=UISwipeGestureRecognizerDirectionRight;
            
            [self rotate];
        }
        
    }
    
    if(gesture.state==UIGestureRecognizerStateFailed)
    {
         NSLog(@"failed");
    }
    
}


-(void)rotate{
    
    
    [UIView beginAnimations:@"rotate" context:(__bridge void *)myImageView];
    
    [UIView setAnimationDuration:4];
    [UIView setAnimationRepeatCount:1];
    
    
    if([lLable.text isEqual:@"right"])
    {
    
    myImageView.transform=CGAffineTransformMakeRotation((M_2_PI*360)/180);
    }
    
    if([lLable.text isEqual:@"left"])
    {
         myImageView.transform=CGAffineTransformMakeRotation((-(M_2_PI*360)/180));
        
    }
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(onRotateStopped:finished:contex:)];
    [UIView commitAnimations];
    
    
    
}



@end
