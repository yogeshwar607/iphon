//
//  NextViewController.h
//  MultiScreenApp
//
//  Created by Rajesh on 09/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"

@interface NextViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lableNum;
- (IBAction)onFact:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lableResult;
- (IBAction)onBack:(id)sender;

@property int number;
@property HomeViewController *homeCon;
@end
