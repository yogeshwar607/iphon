//
//  ViewController.h
//  SwipeDemo
//
//  Created by Rajesh on 16/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *myimageView;
@property  CGRect imageFrame;
@property CGSize imageSize;

-(void)onSwipe:(UISwipeGestureRecognizer *)gesture;
-(void)onPinch:(UIPinchGestureRecognizer *)gesture;
-(void)onRotate:(UIRotationGestureRecognizer *)gesture;
@property NSMutableArray *arrayImages;
@end

