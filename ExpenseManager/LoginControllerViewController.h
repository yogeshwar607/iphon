//
//  LoginControllerViewController.h
//  ExpenseManager
//
//  Created by Rajesh on 19/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginControllerViewController : UIViewController<NSXMLParserDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textEmail;
@property (weak, nonatomic) IBOutlet UITextField *textPassword;

- (IBAction)onLogin:(id)sender;

- (IBAction)onSignUp:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *onForgot;

@end
