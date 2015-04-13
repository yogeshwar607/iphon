//
//  FirstViewController.h
//  SegmentdCntrlNUiSwitchDemo
//
//  Created by Rajesh on 06/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textName;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedGender;

@property (weak, nonatomic) IBOutlet UISwitch *switchStatus;
- (IBAction)onSave:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lableStatus;
- (IBAction)statusgender:(id)sender;

-(IBAction)switchChanged:(id)sender;
@end
