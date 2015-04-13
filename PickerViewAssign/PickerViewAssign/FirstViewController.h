//
//  FirstViewController.h
//  PickerViewAssign
//
//  Created by Rajesh on 08/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *textName;
@property (weak, nonatomic) IBOutlet UILabel *textCity;
- (IBAction)onSelect:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerViewCity;
- (IBAction)onOK:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentEducation;
@property NSMutableArray *mArrayCity;
@property (weak, nonatomic) IBOutlet UIView *myView;
- (IBAction)onSave:(id)sender;
-(IBAction)hideKeyBoard:(id) sender;
@end
