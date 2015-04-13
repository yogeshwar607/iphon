//
//  ProductViewController.h
//  Assign_StoryBoard
//
//  Created by Rajesh on 10/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductViewController : UITableViewController
- (IBAction)onAdd:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *tableViewProduct;
@property NSMutableArray *mArrayProduct;
@end
