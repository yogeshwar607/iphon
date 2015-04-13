//
//  ViewController.h
//  Assign_pfile_college
//
//  Created by Rajesh on 15/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lableName;

@property (weak, nonatomic) IBOutlet UILabel *lableYear;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentType;
- (IBAction)onUpdate:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *courseTable;
-(void)copyPlistToDocFolder;
@property NSMutableDictionary *dUserInfo;
@property NSMutableArray *courseArray;
@property NSString *strPath;
@end

