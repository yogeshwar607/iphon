//
//  FirstViewController.h
//  PickerViewDemo
//
//  Created by Rajesh on 08/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>


@property (weak, nonatomic) IBOutlet UILabel *tableCourse;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerViewCourse;
@property NSMutableArray *mArrayCourses,*mArrayStudent,*mArrayDAC,*mArrayVLSI,*mArrayWIMC,*mArrayDESD,*mArrayDSSD;
@property (weak, nonatomic) IBOutlet UILabel *labelStudent;

@end
