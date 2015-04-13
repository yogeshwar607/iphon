//
//  ViewController.m
//  SwipeDemo
//
//  Created by Rajesh on 16/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"
static int count=0;
@interface ViewController ()

@end

@implementation ViewController
@synthesize myimageView,arrayImages,imageFrame,imageSize;
int imgHeight,imgWidth;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // create a swipe gesture rceognizer
    
    UISwipeGestureRecognizer *swipeGesture=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(onSwipe:)];
    
    // add swipe properties
    
    swipeGesture.numberOfTouchesRequired=1;
    swipeGesture.direction=UISwipeGestureRecognizerDirectionRight;
    
    // add gesture to imageView
    
    [myimageView addGestureRecognizer:swipeGesture];
    myimageView.userInteractionEnabled=true;
    imageFrame=myimageView.frame;
    imageSize=imageFrame.size;
    imgHeight=imageSize.height;
    imgWidth=imageSize.width;
    
    // initialize array of imagess
    
    arrayImages=[[NSMutableArray alloc]initWithObjects:@"background.jpg",@"wn_banner.jpg",@"eclipse_update_120.jpg", nil];
    count=0;
    
    //add pinch gesture
    UIPinchGestureRecognizer *pinchGesture=[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(onPinch:)];
    UIRotationGestureRecognizer *rotationGesture=[[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(onRotate:)];
    
    [myimageView setMultipleTouchEnabled:true];
    [myimageView addGestureRecognizer:pinchGesture];
    [myimageView addGestureRecognizer:rotationGesture];
    //make image at center
    myimageView.center=self.view.center;
    
    
}
-(void)onRotate:(UIRotationGestureRecognizer *)gesture
{
    
    if(gesture.state==UIGestureRecognizerStateBegan)
    {
        NSLog(@"rotation started");
    }
    if(gesture.state==UIGestureRecognizerStateChanged)
    {
        NSLog(@"rotation changed...:%f",gesture.rotation);
        
        myimageView.transform=CGAffineTransformMakeRotation(gesture.rotation);
        myimageView.center=self.view.center;
        
    }
    if(gesture.state==UIGestureRecognizerStateEnded)
    {
        NSLog(@"rotation ended");
    }

    
    
    
}
-(void)onPinch:(UIPinchGestureRecognizer *)gesture
{
    
    if(gesture.state==UIGestureRecognizerStateBegan)
    {
        NSLog(@"pinching started");
    }
    if(gesture.state==UIGestureRecognizerStateChanged)
    {
        NSLog(@"pinching changed...scale:%f, velocity:%f",gesture.scale,gesture.velocity);
        
        myimageView.transform=CGAffineTransformMakeScale(gesture.scale, gesture.scale);
        myimageView.center=self.view.center;
    
        
        
    }
    if(gesture.state==UIGestureRecognizerStateEnded)
    {
        NSLog(@"pinching ended");
    }
    
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
        count++;
            
            if (count>=3) {   // if end of array change direction
                gesture.direction=UISwipeGestureRecognizerDirectionLeft;
            }
            else
            {
        NSString *imageName=[arrayImages objectAtIndex:count];
        myimageView.image=[UIImage imageNamed:imageName];
            }
    }
      
        
        if(d==UISwipeGestureRecognizerDirectionLeft)
        {
            count--;
            
            if (count<=0) {   // if end of array change direction
                gesture.direction=UISwipeGestureRecognizerDirectionRight;
            }
            else
            {
                NSString *imageName=[arrayImages objectAtIndex:count];
                myimageView.image=[UIImage imageNamed:imageName];
            }

        
        
        
        
    }
    if(gesture.state==UIGestureRecognizerStateFailed)
    {
        NSLog(@"failed");
    }
    
}
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
