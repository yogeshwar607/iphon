//
//  SettingViewController.h
//  UserDefaultDemo
//
//  Created by Rajesh on 12/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textOldPass;
- (IBAction)onChangePassword:(id)sender;
- (IBAction)onBack:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textNewPass;
@end
