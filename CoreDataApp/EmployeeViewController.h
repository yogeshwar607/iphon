//
//  EmployeeViewController.h
//  CoreDataApp
//
//  Created by Rajesh on 12/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmployeeViewController : UIViewController
// object store
@property NSManagedObject *object;
@property (weak, nonatomic) IBOutlet UITextField *textId;
@property (weak, nonatomic) IBOutlet UITextField *textName;
@property (weak, nonatomic) IBOutlet UITextField *textSalary;


- (IBAction)onDone:(id)sender;

@end
