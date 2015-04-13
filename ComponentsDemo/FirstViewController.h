//
//  FirstViewController.h
//  ComponentsDemo
//
//  Created by Rajesh on 06/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textName;
- (IBAction)buttonSubmit:(id)sender;

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
