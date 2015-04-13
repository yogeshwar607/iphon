//
//  ViewController.h
//  Assign_DynamicSwitch
//
//  Created by Rajesh on 17/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
-(void)onSwipe:(UISwipeGestureRecognizer *)gesture;
@property UILabel *lLable;
@property UIView *myView;
@property UIImageView *myImageView;
-(void)rotate;
@end

