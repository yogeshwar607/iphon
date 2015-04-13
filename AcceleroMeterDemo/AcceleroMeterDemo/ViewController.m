//
//  ViewController.m
//  AcceleroMeterDemo
//
//  Created by Rajesh on 17/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize labelData,motionManager;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    motionManager=[[CMMotionManager alloc]init];
    
    if([motionManager isAccelerometerAvailable])
    {
        //start reading acceleration data
        NSOperationQueue *queue=[[NSOperationQueue alloc]init];
        [motionManager startAccelerometerUpdatesToQueue:queue withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
            float x=accelerometerData.acceleration.x;
            float y=accelerometerData.acceleration.y;
            float z=accelerometerData.acceleration.z;
            labelData.text=[NSString stringWithFormat:@"%f,%f,%f",x,y,z];
            [labelData sizeToFit];
        }];
    }
    else
        NSLog(@"no Acceelerometer available");
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
