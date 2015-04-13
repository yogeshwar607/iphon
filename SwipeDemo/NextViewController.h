//
//  NextViewController.h
//  SwipeDemo
//
//  Created by Rajesh on 16/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NextViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lableDrag;
-(void)onPan:(UIPanGestureRecognizer *)gesture;
@end
