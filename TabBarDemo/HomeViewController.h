//
//  HomeViewController.h
//  TabBarDemo
//
//  Created by Rajesh on 10/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textNum;
- (IBAction)onHelp:(id)sender;

- (IBAction)onCube:(id)sender;

- (IBAction)onRefresh:(id)sender;

@end
