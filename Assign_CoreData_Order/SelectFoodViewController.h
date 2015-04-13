//
//  SelectFoodViewController.h
//  Assign_CoreData_Order
//
//  Created by Rajesh on 12/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectFoodViewController : UITableViewController
- (IBAction)onAdd:(id)sender;
@property NSMutableArray *arrayItem;

- (IBAction)onEdit:(id)sender;
@property NSManagedObject *object;
@end
