//
//  FirstViewController.h
//  AlertViewDemo
//
//  Created by Rajesh on 06/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textNum;

@property (weak, nonatomic) IBOutlet UILabel *lableResut;

- (IBAction)onProcess:(id)sender;

@end
