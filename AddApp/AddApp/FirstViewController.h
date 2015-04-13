//
//  FirstViewController.h
//  AddApp
//
//  Created by Rajesh on 06/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textNum1;
@property (weak, nonatomic) IBOutlet UITextField *textNum2;
- (IBAction)buttonAdd:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *buttonAdd;
@property (weak, nonatomic) IBOutlet UILabel *lableResult;
- (IBAction)buttonMul:(id)sender;

@end
