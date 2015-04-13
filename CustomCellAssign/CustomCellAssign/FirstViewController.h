//
//  FirstViewController.h
//  CustomCellAssign
//
//  Created by Rajesh on 08/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *textName;
@property (weak, nonatomic) IBOutlet UITextField *textPrice;
- (IBAction)onAdd:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableViewItem;
- (IBAction)onTotal:(id)sender;
-(IBAction)hideKeyBoard:(id)sender;
@property NSMutableArray *mArrayItem;
@end
