//
//  AddDetailViewController.h
//  Assign_pfile_college
//
//  Created by Rajesh on 15/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface AddDetailViewController : UIViewController



@property (weak, nonatomic) IBOutlet UITextField *textCollegename;

@property (weak, nonatomic) IBOutlet UITextField *textYear;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentType;
@property (weak, nonatomic) IBOutlet UITextField *textCoursename;
@property (weak, nonatomic) IBOutlet UITextField *textCourseFees;
@property (weak, nonatomic) IBOutlet UITextField *textDuration;
@property NSString *listPath;
- (IBAction)onDone:(id)sender;

@property ViewController *myViewController;
@end
