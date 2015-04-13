//
//  FirstViewController.h
//  CustomCellTableViewDemo
//
//  Created by Rajesh on 08/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *textName;
@property (strong, nonatomic) IBOutlet UITextField *textAge;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentGender;
- (IBAction)onAdd:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableViewPerson;
@property NSMutableArray *mArrayPerson;
- (IBAction)hideKeyBoard:(id)sender;
- (IBAction)onDelete:(id)sender;

@end
