//
//  UpdateHealthRecordController.h
//  DataBase_AssignMent
//
//  Created by Rajesh on 11/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpdateHealthRecordController : UIViewController<UITextFieldDelegate>
- (IBAction)onSubmit:(id)sender;

@property (weak, nonatomic) IBOutlet UISegmentedControl *typeSegment;

@property (weak, nonatomic) IBOutlet UITextField *textRecordValue;

@property (weak, nonatomic) IBOutlet UILabel *lableDate;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;


@end
