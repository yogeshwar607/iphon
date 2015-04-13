//
//  FirstViewController.h
//  DatePickerDemo
//
//  Created by Rajesh on 06/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

- (IBAction)onSaveButton:(id)sender;

- (IBAction)onSelect:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *textName;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
- (IBAction)onOK:(id)sender;

- (IBAction)hidekb:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *dateView;

@end
