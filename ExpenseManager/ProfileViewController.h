//
//  ProfileViewController.h
//  ExpenseManager
//
//  Created by Rajesh on 20/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController
@property NSDictionary *managerDetails;

@property (weak, nonatomic) IBOutlet UITextField *textuserId;

@property (weak, nonatomic) IBOutlet UITextField *textUserType;
@property (weak, nonatomic) IBOutlet UITextField *textName;
@property (weak, nonatomic) IBOutlet UITextField *textContact;
@property (weak, nonatomic) IBOutlet UITextField *textEmail;
@property (weak, nonatomic) IBOutlet UITextField *textOccupation;
@property (weak, nonatomic) IBOutlet UITextField *textAddress;

@end
