//
//  ViewController.h
//  AcceleroMeterDemo
//
//  Created by Rajesh on 17/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *labelData;


@property CMMotionManager *motionManager;
@end

