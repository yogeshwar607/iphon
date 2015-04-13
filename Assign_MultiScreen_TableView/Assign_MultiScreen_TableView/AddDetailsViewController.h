//
//  AddDetailsViewController.h
//  Assign_MultiScreen_TableView
//
//  Created by Rajesh on 09/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataViewController.h"
@interface AddDetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textFname;
@property (weak, nonatomic) IBOutlet UITextField *textLname;
- (IBAction)onAdd:(id)sender;
@property DataViewController *dataCon;
@end
