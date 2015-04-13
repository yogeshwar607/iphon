//
//  ViewController.h
//  Assign_specialDays
//
//  Created by Rajesh on 15/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textName;

@property (weak, nonatomic) IBOutlet UITextField *textContactNo;

@property (weak, nonatomic) IBOutlet UITextField *textEmail;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentType;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
- (IBAction)onSave:(id)sender;
- (IBAction)onGallery:(id)sender;

@end

