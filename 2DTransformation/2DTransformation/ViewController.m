//
//  ViewController.m
//  2DTransformation
//
//  Created by Rajesh on 17/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize myImageView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onScale:(id)sender {
    
    [UIView beginAnimations:@"scale" context:(__bridge void *)myImageView];
    
    [UIView setAnimationDuration:5];
    [UIView setAnimationRepeatCount:2];
    [UIView setAnimationRepeatAutoreverses:YES];
    
    
    myImageView.transform=CGAffineTransformMakeScale(3.0f, 3.0f);
    
    
    
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(onScaleStopped:finished:contex:)];
    
    [UIView commitAnimations];

}

- (IBAction)onRotate:(id)sender {
    
    
    [UIView beginAnimations:@"rotate" context:(__bridge void *)myImageView];
    
    [UIView setAnimationDuration:8];
    [UIView setAnimationRepeatCount:2];
  
    
    
    myImageView.transform=CGAffineTransformMakeRotation((M_2_PI*360)/180);
    
    
    
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(onRotateStopped:finished:contex:)];
    [UIView commitAnimations];

    
}

- (IBAction)onTranslate:(id)sender {
    
    [myImageView setAlpha:1.0f];
    [UIView beginAnimations:@"translate" context:(__bridge void *)myImageView];
    
    [UIView setAnimationDuration:5];
    [UIView setAnimationRepeatCount:3];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(onTranslateStopped:finished:contex:)];
    
    
    // set translate position
    
    CGRect newFrame=CGRectMake(300, 400, 100, 100);
    [myImageView setFrame:newFrame];
    
    
    // start animation
    
        [myImageView setAlpha:0.0f];
    [UIView commitAnimations];
    
}

-(void)onRotateStopped:(NSString *)paramAnimationID
             finished:(NSNumber *)paramFinished
               contex:(void *)paramContex
{
    NSLog(@"rotation is finished %@ %@",paramAnimationID,paramFinished);
    CGRect newFrame=CGRectMake(50, 100, 500, 400);
    [myImageView setFrame:newFrame];
}


-(void)onScaleStopped:(NSString *)paramAnimationID
                 finished:(NSNumber *)paramFinished
                   contex:(void *)paramContex
{
    NSLog(@"scaling is finished %@ %@",paramAnimationID,paramFinished);
    
    CGRect newFrame=CGRectMake(50, 100, 500, 400);
    [myImageView setFrame:newFrame];
    
    
}



-(void)onTranslateStopped:(NSString *)paramAnimationID
                 finished:(NSNumber *)paramFinished
                   contex:(void *)paramContex
{
    NSLog(@"Translate finished %@ %@",paramAnimationID,paramFinished);
    
    CGRect newFrame=CGRectMake(50, 100, 500, 400);
    [myImageView setFrame:newFrame];

    
}

    
@end
