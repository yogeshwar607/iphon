//
//  SpecialDayTableViewController.h
//  Assign_specialDays
//
//  Created by Rajesh on 15/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpecialDayTableViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *myImage;
@property NSMutableArray *arraySpecialDays;
-(void)call;
@end
