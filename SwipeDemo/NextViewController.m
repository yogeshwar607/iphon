//
//  NextViewController.m
//  SwipeDemo
//
//  Created by Rajesh on 16/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController
@synthesize lableDrag;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIPanGestureRecognizer *panGesture=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(onPan:)];
    panGesture.minimumNumberOfTouches=1;
    
    [lableDrag addGestureRecognizer:panGesture];
    [lableDrag setUserInteractionEnabled:true];
    
    
}


-(void)onPan:(UIPanGestureRecognizer *)gesture
{
    if(gesture.state==UIGestureRecognizerStateBegan)
       {
           NSLog(@"begin...");
       }
    
    if(gesture.state==UIGestureRecognizerStateEnded)
    {
        NSLog(@"drag end...");
        
        CGPoint point=[gesture locationInView:self.view];
        
        NSLog(@"x--%f,y--%f",point.x,point.y);

        [self.lableDrag setFrame:CGRectMake(point.x, point.y, 150, 40)];
    }
    

    if(gesture.state==UIGestureRecognizerStateChanged)
    {
        NSLog(@"drag changed...");
    }
    
    CGPoint point=[gesture locationInView:self.view];
    
    NSLog(@"ended");
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
