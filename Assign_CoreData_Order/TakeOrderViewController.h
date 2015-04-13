//
//  TakeOrderViewController.h
//  Assign_CoreData_Order
//
//  Created by Rajesh on 12/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TakeOrderViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
- (IBAction)onDone:(id)sender;
- (IBAction)onAdd:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UITextField *textTableNo;
@property (weak, nonatomic) IBOutlet UILabel *labelempId;
@property NSManagedObject *object,*doneObject;
@property NSMutableArray *arrayOrderDetails;
@property NSString *empId;
@end
