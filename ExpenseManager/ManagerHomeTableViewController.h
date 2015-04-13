//
//  ManagerHomeTableViewController.h
//  ExpenseManager
//
//  Created by Rajesh on 19/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManagerHomeTableViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>
@property NSDictionary *manDetails;
- (IBAction)onProfileClick:(id)sender;

@end
