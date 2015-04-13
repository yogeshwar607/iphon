//
//  AddItemViewController.h
//  Assign_CoreData_Order
//
//  Created by Rajesh on 12/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddItemViewController : UIViewController

- (IBAction)onDone:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textItemName;
@property (weak, nonatomic) IBOutlet UITextField *textItemPrice;
@property NSManagedObject *object;
@end
