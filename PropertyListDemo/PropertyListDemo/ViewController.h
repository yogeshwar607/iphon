//
//  ViewController.h
//  PropertyListDemo
//
//  Created by Rajesh on 15/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lablefullName;

@property (weak, nonatomic) IBOutlet UILabel *lablePhonenumber;
@property (weak, nonatomic) IBOutlet UITextField *textAge;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentStatus;
- (IBAction)onUpdate:(id)sender;

@property NSMutableDictionary *dUserInfo;

-(void)copyPlistToDocFolder;

@end

