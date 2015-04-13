//
//  UpdateStudentController.h
//  SqlLiteDemo1
//
//  Created by Rajesh on 11/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

@interface UpdateStudentController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *textRoll;
@property (weak, nonatomic) IBOutlet UITextField *textName;
@property (weak, nonatomic) IBOutlet UITextField *textMarks;
@property (weak, nonatomic) IBOutlet UITextField *textSubject;
- (IBAction)onDelete:(id)sender;
- (IBAction)onSave:(id)sender;

@property Student *student;

@end
