//
//  DataViewController.h
//  Assign_MultiScreen_TableView
//
//  Created by Rajesh on 09/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataViewController : UITableViewController<UIAlertViewDelegate>
@property NSMutableArray *mArrayName;
@property (strong, nonatomic) IBOutlet UITableView *myTableView;

@end
		