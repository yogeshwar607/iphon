//
//  FirstViewController.h
//  LAbleViewDemo
//
//  Created by Rajesh on 08/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *mArrayNames;
@end
